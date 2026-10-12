FROM	alpine:3.24

RUN	apk update \
	&& apk upgrade -y --no-cache \
	&& apk add nginx

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://127.0.0.1:80/ >/dev/null 2>&1 || exit 1

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
