if [ -d "packmate-starter" ]; then
    rm -rf packmate-starter
fi
git clone https://gitlab.com/packmate/starter.git packmate-starter
cd packmate-starter
PACKMATE_LOCAL_IP="$(hostname -I | awk '{print $1}')"
PACKMATE_WEB_LOGIN=ufoufo
PACKMATE_WEB_PASSWORD="$(mktemp -u XXXXXXXXXXXXXXXXXXX)"
PACKMATE_INTERFACE="$(ip -o -4 route show to default | awk '{print $5}')"
echo "Generated user: $PACKMATE_WEB_LOGIN:$PACKMATE_WEB_PASSWORD"
echo "Host: $PACKMATE_INTERFACE:$PACKMATE_LOCAL_IP"

echo << EOF > .env
PACKMATE_LOCAL_IP=$PACKMATE_LOCAL_IP
PACKMATE_WEB_LOGIN=$PACKMATE_WEB_LOGIN
PACKMATE_WEB_PASSWORD=$PACKMATE_WEB_PASSWORD
PACKMATE_MODE=LIVE
PACKMATE_INTERFACE=$PACKMATE_INTERFACE
PACKMATE_OLD_STREAMS_CLEANUP_ENABLED=true
PACKMATE_OLD_STREAMS_CLEANUP_INTERVAL=5
PACKMATE_OLD_STREAMS_CLEANUP_THRESHOLD=60
EOF
docker compose up --build -d
