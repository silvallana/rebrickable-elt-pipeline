import gzip
import logging
import shutil
from pathlib import Path

import requests

FILES_TO_LOAD = [
    "themes",
    "colors",
    "part_categories",
    "parts",
    "part_relationships",
    "elements",
    "sets",
    "minifigs",
    "inventories",
    "inventory_parts",
    "inventory_sets",
    "inventory_minifigs"
]

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
log = logging.getLogger(__name__)


def download_file(name: str, out_dir: Path) -> Path:
    url = f"https://cdn.rebrickable.com/media/downloads/{name}.csv.gz"
    gz_path = out_dir / f"{name}.csv.gz"
    csv_path = out_dir / f"{name}.csv"
    
    last_error = None
    for attempt in range(1, 4):
        try:
            log.info(f"Downloading {name} (Attempt {attempt}) from {url}")
            response = requests.get(url, timeout=30)
            response.raise_for_status()
            gz_path.write_bytes(response.content)
            
            with gzip.open(gz_path, "rb") as f_in, open(csv_path, "wb") as f_out:
                shutil.copyfileobj(f_in, f_out)
                
            gz_path.unlink()
            
            log.info(f"Saved {csv_path} ({csv_path.stat().st_size} bytes)")
            return csv_path
        
        except Exception as e:
            last_error = e
            log.warning(f"Failed to download {name}: {e}")
            
    raise RuntimeError(f"Failed to download {name} after 3 attempts") from last_error


def run():
    out_dir = Path("./data")
    out_dir.mkdir(parents=True, exist_ok=True)
    
    downloaded = []
    for name in FILES_TO_LOAD:
        downloaded.append(download_file(name, out_dir))
        
    log.info(f"Extract complete ({len(downloaded)} files ready in {out_dir})")
    return downloaded

if __name__ == "__main__":
    run()

