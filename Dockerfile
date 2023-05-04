FROM alpine:latest
LABEL maintainer="James Eckersall <james.eckersall@gmail.com>"
RUN apk add --update --no-cache tftp-hpa
EXPOSE 69/udp
ENTRYPOINT ["in.tftpd"]
CMD ["-L", "--secure", "-v", "/var/tftpboot"]
