FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=job_database
ENV MYSQL_USER=job_user
ENV MYSQL_PASSWORD=job_password

COPY ./job_database.sql /docker-entrypoint-initdb.d/
