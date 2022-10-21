FROM alpine:3.16.2
LABEL org.opencontainers.image.authors="BCP - Matrix"

# instalando paquetes
RUN nodejs=16.17.1-r0 \
  tzdata=2022c-r0

# configurando zona horaria
RUN cp /usr/share/zoneinfo/America/Lima /etc/localtime && \
  echo "America/Lima" > /etc/timezone
ENV TZ=America/Lima

COPY ./node_modules node_modules
COPY package.json .
COPY src src

CMD [ "node", "src/index.js" ]