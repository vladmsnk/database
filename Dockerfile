FROM postgres:14.0
ADD ./initSQL/init.sql /docker-entrypoint-initdb.d/