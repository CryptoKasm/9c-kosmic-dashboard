FROM ubuntu
LABEL maintainer="cryptokasm.io"
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt update
RUN apt install curl unzip apache2 -y
RUN apt install apache2-utils -y
RUN apt clean

# Install Ngrok2
RUN curl -s -O https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip \
    && unzip ngrok-stable-linux-amd64.zip \
    && mv ngrok /usr/local/bin/ \
    && rm -f ngrok-stable-linux-amd64.zip

# Open ports for webserver
EXPOSE 80
EXPOSE 4040

# Start service
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Copy root directory to image
COPY ./dist/ /var/www/html/