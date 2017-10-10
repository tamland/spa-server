FROM nginx:alpine

EXPOSE 80
ENV EXPOSE_VARS=""

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
