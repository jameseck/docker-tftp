FROM debian:stable-slim
LABEL maintainer="James Eckersall <james.eckersall@gmail.com>"
RUN \
  apt update && \
  apt install -y atftpd procps && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 69/udp
VOLUME /var/tftpboot
ENTRYPOINT ["/usr/sbin/atftpd"]
# If we specify -v 7 and --trace, commands all fail because atftpd is still trying to write to /dev/log instead of /dev/stdout as we've specified.....
CMD ["--user", "nobody.nogroup", "--daemon", "--no-fork", "--port", "69", "--logfile", "/dev/stdout", "-v", "/var/tftpboot"]
