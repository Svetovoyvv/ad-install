mkdir firegex
cd firegex
PASSWORD="$(cat /etc/services-password.txt)"
sh <(curl -sLf https://pwnzer0tt1.it/firegex.sh) start --standalone --port 47502 --psw-on-web --startup-psw "$PASSWORD"
cd -
