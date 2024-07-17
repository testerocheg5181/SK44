# Используем официальный базовый образ PHP с Apache
FROM php:7.4-apache

# Установка ServerName в Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Обновляем индекс пакетов и устанавливаем необходимые пакеты и расширения
RUN apt-get update && \
    apt-get install -y curl libcurl4-openssl-dev && \
    docker-php-ext-install curl

# Копируем файлы вашего приложения в рабочую директорию контейнера
COPY . /var/www/html/

# Открываем порт 80 для HTTP
EXPOSE 80

# Команда для запуска Apache в фоновом режиме
CMD ["apache2-foreground"]
