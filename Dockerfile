FROM kasmweb/chrome:1.18.0

EXPOSE 6901 8080

ENV HOME=/home/kasm-user
ENV VNC_PW=123456
ENV VNC_RESOLUTION=1600x1000

USER root
RUN mkdir -p /var/lib/apt/lists/partial && apt-get update && apt-get install -y --no-install-recommends nginx && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /var/cache/nginx /var/run /var/log/nginx /var/lib/nginx /var/lib/nginx/body /var/lib/nginx/proxy /var/lib/nginx/fastcgi /var/lib/nginx/uwsgi /var/lib/nginx/scgi
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-kasm.conf /etc/nginx/conf.d/default.conf
COPY docker-entrypoint.sh /dockerstartup/docker-entrypoint.sh
RUN chmod +x /dockerstartup/docker-entrypoint.sh

WORKDIR /home/kasm-user
ENTRYPOINT ["/dockerstartup/docker-entrypoint.sh"]
