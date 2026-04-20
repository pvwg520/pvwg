FROM alpine:latest

RUN apk add --no-cache wget tar

WORKDIR /app

# 下载 sing-box
RUN wget https://github.com/SagerNet/sing-box/releases/download/v1.10.1/sing-box-1.10.1-linux-amd64.tar.gz && \
    tar -zxvf sing-box-1.10.1-linux-amd64.tar.gz && \
    mv sing-box-1.10.1-linux-amd64/sing-box . && \
    rm -rf sing-box-1.10.1-linux-amd64*

COPY config.json .

# 暴露两个端口：8080 给节点，8081 给健康检查
EXPOSE 8080 8081

CMD ["./sing-box", "run", "-c", "config.json"]
