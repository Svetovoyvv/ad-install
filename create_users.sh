#!/bin/bash

# Папка с ключами
KEYS_DIR="./users"

# Проверяем, существует ли папка
if [ ! -d "$KEYS_DIR" ]; then
    echo "Папка $KEYS_DIR не найдена!"
    exit 1
fi

# Проходим по всем файлам с расширением .pub в папке keys
for pub_key_file in "$KEYS_DIR"/*.key.pub; do
    # Проверяем, существует ли файл
    if [ ! -f "$pub_key_file" ]; then
        echo "Нет файлов с расширением .key.pub в папке $KEYS_DIR"
        continue
    fi

    # Извлекаем имя пользователя из имени файла
    username=$(basename "$pub_key_file" .key.pub)

    # Создаем пользователя без пароля
    useradd -m -s /bin/bash "$username"

    # Проверяем успешность создания пользователя
    if [ $? -ne 0 ]; then
        echo "Не удалось создать пользователя $username"
        continue
    fi

    # Добавляем публичный ключ в файл авторизованных ключей
    mkdir -p "/home/$username/.ssh"
    cat "$pub_key_file" >> "/home/$username/.ssh/authorized_keys"

    # Устанавливаем правильные права
    chown -R "$username:$username" "/home/$username/.ssh"
    chmod 700 "/home/$username/.ssh"
    chmod 600 "/home/$username/.ssh/authorized_keys"

    echo "Пользователь $username создан и настроен для входа по ключу."
done