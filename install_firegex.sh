mkdir firegex
cd firegex
sh <(curl -sLf https://pwnzer0tt1.it/firegex.sh)
PASSWORD="$(cat /etc/services-password.txt)"
python3 firegex.py start --standalone --port 47502 --psw-on-web --startup-psw "$PASSWORD"
cd -
