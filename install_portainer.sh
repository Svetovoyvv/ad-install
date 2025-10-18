apt install apache2-utils
PASSWORD="$(cat /etc/services-password.txt)"
PASSWORD_HASH="$(htpasswd -nb -B "admin" "$PASSWORD")"
docker compose -f portainer-compose.yaml up -d