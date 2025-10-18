apt install -y apache2-utils
PASSWORD="$(cat /etc/services-password.txt)"
PASSWORD_HASH="$(htpasswd -nb -B "admin" "$PASSWORD")"
echo "Сгенерированный хеш пароля: $PASSWORD_HASH"
echo "PASSWORD_HASH=$PASSWORD_HASH" > .portainer.env
docker compose -f portainer-compose.yaml --env-file .portainer.env up -d