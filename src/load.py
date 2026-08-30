import logging
import psycopg

from config import DB_CONFIG, BASE_DIR, DATA_DIR, FILES_TO_LOAD

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
log = logging.getLogger(__name__)


def get_connection():
    return psycopg.connect(**DB_CONFIG)


def apply_raw_ddl(connection):
    ddl_path = BASE_DIR / "sql" / "raw_ddl.sql"
    ddl = ddl_path.read_text()

    log.info("Applying raw DDL")
    with connection.cursor() as cursor:
        cursor.execute(ddl)
    log.info("Raw DDL applied")


def load_file(cursor, table_name: str):
    file_path = DATA_DIR / f"{table_name}.csv"

    if not file_path.exists():
        raise FileNotFoundError(f"{file_path} not found")

    log.info(f"Refreshing raw.{table_name}")

    cursor.execute(f"TRUNCATE TABLE raw.{table_name}")

    with file_path.open("r", encoding="utf-8") as file:
        with cursor.copy(f"""
            COPY raw.{table_name}
            FROM STDIN
            WITH (
                FORMAT CSV,
                HEADER TRUE
            )
            """) as copy:
            while data := file.read(8192):
                copy.write(data)

    log.info(f"Finished loading raw.{table_name}")


def run():
    with get_connection() as connection:

        try:
            apply_raw_ddl(connection)

            with connection.cursor() as cursor:
                for table_name in FILES_TO_LOAD:
                    load_file(cursor, table_name)

            connection.commit()

            log.info("Load complete. Raw layer ready for dbt.")

        except Exception:
            connection.rollback()
            log.exception("Load failed. Transaction rolled back.")
            raise


if __name__ == "__main__":
    run()
