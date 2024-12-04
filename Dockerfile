# 使用轻量级的基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 复制 frps 可执行文件和配置文件到容器中
COPY frps /app/frps
COPY frps.ini /app/frps.ini

# 暴露 frp 服务端和管理面板的端口
EXPOSE 7000 7500

# 指定容器启动时的命令
CMD ["./frps", "-c", "/app/frps.ini"]
