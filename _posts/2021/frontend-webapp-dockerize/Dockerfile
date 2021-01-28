FROM nginx:alpine

RUN apk add bash --no-cache
ADD entrypoint.sh /entrypoint.sh
ADD dist /usr/share/nginx/html
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
