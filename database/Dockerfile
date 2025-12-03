FROM postgres:15

ENV POSTGRES_DB=countries_db
ENV POSTGRES_USER=cn_user
ENV POSTGRES_PASSWORD=cn_pass

COPY ./*.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

