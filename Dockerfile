FROM	alpine:3.24

RUN	apk update \
	&& apk upgrade -y --no-cache \
	&& apk add nginx



