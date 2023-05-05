FROM debian:stable-slim
LABEL maintainer="James Eckersall <james.eckersall@gmail.com>"
RUN \
  apt update && \
  apt install -y atftpd && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 69/udp
ENTRYPOINT ["/usr/sbin/atftpd"]
CMD ["--user", "nobody.nogroup", "--daemon", "--no-fork", "--port", "69", "--logfile", "/dev/stdout", "/var/tftpboot"]
