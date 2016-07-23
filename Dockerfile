FROM mono:4.0.1

RUN apt-get update && \
  apt-get install -y mono-fastcgi-server4 nginx supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY fastcgi_params /etc/nginx/fastcgi_params

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

VOLUME /var/www/app

CMD ["/usr/bin/supervisord"]



