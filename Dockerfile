# pythonのバージョンは任意
FROM python:3.12-slim-bookworm
WORKDIR /code
ENV FLASK_APP=app
ENV FLASK_DEBUG=1
RUN adduser --uid 1000 --disabled-password --gecos '' invenio

COPY /app/requirements.txt ./
ENV INVENIO_WEB_HOST=127.0.0.1
ENV INVENIO_WEB_INSTANCE=invenio
ENV INVENIO_WEB_VENV=invenio
ENV INVENIO_WEB_HOST_NAME=invenio
ENV INVENIO_USER_EMAIL=wekosoftware@nii.ac.jp
ENV INVENIO_USER_PASS=uspass123
ENV INVENIO_POSTGRESQL_HOST=postgresql
ENV INVENIO_POSTGRESQL_DBNAME=invenio
ENV INVENIO_POSTGRESQL_DBUSER=invenio
ENV INVENIO_POSTGRESQL_DBPASS=dbpass123
ENV INVENIO_WORKER_HOST=127.0.0.1
ENV INVENIO_DB_POOL_CLASS=QueuePool

RUN apt-get update
RUN apt-get -y install libpq-dev
RUN apt-get install gcc -y
RUN pip install --upgrade pip
RUN pip install -r requirements.txt