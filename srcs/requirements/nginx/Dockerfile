FROM debian:bullseye

ARG WP_PATH
ARG WP_URL

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y gettext \
      nginx \
      openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=TANGER-TETOUAN/L=MARTIL/O=1337/OU=1337/CN=abelayad.42.fr/UID=abelayad"

COPY conf/nginx.conf /etc/nginx/nginx.conf.template
RUN export WP_PATH=$WP_PATH WP_URL=$WP_URL && \
    envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

CMD ["nginx"]

EXPOSE 443
