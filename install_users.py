import json
from glob import glob
from pathlib import Path

user_configs = Path("users").glob("*.key.pub")

for user_config in user_configs:
    user_name = user_config.name.removesuffix('.key.pub')
    user_key = user_config.read_text()

