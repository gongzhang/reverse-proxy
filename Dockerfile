FROM nginx:alpine

COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template

EXPOSE 80

ENV DOLLAR='$' \
    LOCATION=/ \
    PROXY_PASS=http://localhost

CMD envsubst < /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
