FROM ubuntu:latest

ENV SERVER_PORT=8800

RUN apt-get update && apt-get -y install golang-go
RUN mkdir -p /opt/webserver
WORKDIR /opt/webserver
COPY main.go /opt/webserver
RUN go build /opt/webserver/main.go && \
    mv /opt/webserver/main /opt/webserver/server
COPY staticfiles /opt/webserver
EXPOSE $SERVER_PORT:8080
CMD [ "./server", "8080" ]
