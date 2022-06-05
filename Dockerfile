FROM ubuntu:21.04
COPY bin/gotaset_linux /opt/gotaset_linux
WORKDIR /data
VOLUME /data

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["gotaset"]
