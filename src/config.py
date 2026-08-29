import os
from dotenv import load_dotenv


load_dotenv()


DB_CONFIG = {
    "host": os.getenv("PG_HOST"),
    "port": os.getenv("PG_PORT"),
    "dbname": os.getenv("PG_DATABASE"),
    "user": os.getenv("PG_USER"),
    "password": os.getenv("PG_PASSWORD"),
}