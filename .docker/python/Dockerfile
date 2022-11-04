FROM alpine:3.16

WORKDIR /usr/src/api
COPY api/ .

RUN apk add --no-cache python3-dev py3-pip musl-dev musl-dev mariadb-dev gcc && pip install -r requirements.txt

CMD python3 api.py