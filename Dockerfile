FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y wget curl git python3 python3-pip neofetch && \
    rm -rf /var/lib/apt/lists/*

RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

EXPOSE 8080

CMD ["/bin/bash", "-c", "\
PORT=${PORT:-8080} && \
exec /bin/ttyd -i 0.0.0.0 -p $PORT /bin/bash"]
