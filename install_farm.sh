INSTALL_PATH="farm"
if [ -d "$INSTALL_PATH" ]; then
    rm -rf "$INSTALL_PATH"
fi
git clone https://github.com/Svetovoyvv/UfoFarm.git "$INSTALL_PATH"
cd "$INSTALL_PATH"
FARM_SERVER_PASSWORD="$(mktemp -u XXXXXXXXXXXXXXXXXXX)"
echo "Generated password: $FARM_SERVER_PASSWORD"
docker compose up --build -d
cd -
