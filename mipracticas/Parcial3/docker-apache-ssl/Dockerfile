FROM ubuntu:22.04

RUN apt update && apt install -y apache2 openssl

# Crear certificado SSL autofirmado
RUN mkdir /etc/apache2/ssl && \
    openssl req -x509 -nodes -days 365 \
    -subj "/C=CO/ST=Valle/L=Cali/O=UAO/OU=Telematicos/CN=webapp.local" \
    -newkey rsa:2048 \
    -keyout /etc/apache2/ssl/apache.key \
    -out /etc/apache2/ssl/apache.crt

# Habilitar módulos SSL y rewrite
RUN a2enmod ssl
RUN a2enmod rewrite

# Copiar archivos HTML
COPY html/ /var/www/html/

# Configuración SSL
RUN tee /etc/apache2/sites-available/ssl.conf > /dev/null <<EOF2
<VirtualHost *:443>
    DocumentRoot /var/www/html/
    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/apache.crt
    SSLCertificateKeyFile /etc/apache2/ssl/apache.key
</VirtualHost>
EOF2

RUN a2ensite ssl.conf && a2dissite 000-default.conf

EXPOSE 80 443

CMD ["apache2ctl", "-D", "FOREGROUND"]
