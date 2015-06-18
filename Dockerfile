FROM mono:4.0.1

RUN apt-get update && \
  apt-get install -y mono-fastcgi-server4=3.8-0xamarin2 nginx=1.2.1-2.2+wheezy3 supervisor=3.0a8-1.1+deb7u1

COPY supervisord.conf /etc/supervisord.conf
COPY fastcgi_params /etc/nginx/fastcgi_params

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

VOLUME /var/www/app

CMD ["/usr/bin/supervisord"]



