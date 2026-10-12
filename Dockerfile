FROM	alpine:3.24

RUN	apk update \
	&& apk upgrade --no-cache \
	&& apk add nginx \
	&& sed -i 's/return 404/root \/var\/www\/localhost\/htdocs/g' /etc/nginx/http.d/default.conf \
	&& echo "SERVER OK" > /var/www/localhost/htdocs/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://127.0.0.1:80/ >/dev/null 2>&1 || exit 1

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
