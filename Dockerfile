FROM nginx:1.27-alpine
RUN rm -rf /usr/share/nginx/html/*
ADD --chown=nginx:nginx index.html /usr/share/nginx/html/
RUN chown -R  nginx:nginx /var/log/nginx/ \
               /var/cache/nginx \
               && touch /run/nginx.pid \
               && chown nginx:nginx /run/nginx.pid
USER nginx
CMD ["nginx","-g","daemon off;"]
