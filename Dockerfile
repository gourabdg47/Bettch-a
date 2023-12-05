FROM python:3.7.5-slim-buster
MAINTAINER Gourab Dasgupta <gourab.dasguptapro@gmail.com>

ENV INSTALL_PATH /bettch_core
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD gunicorn -b 0.0.0.0:8000 --access-logfile - "bettch_core.app:create_app()"
