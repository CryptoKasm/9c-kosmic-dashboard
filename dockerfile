FROM ubuntu
LABEL maintainer="cryptokasm.io"
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt update
RUN apt install apache2 -y
RUN apt install apache2-utils -y
RUN apt clean

# Open Port 80 for webserver
EXPOSE 80

# Start service
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Copy root directory to image
COPY ./dist/ /var/www/html/