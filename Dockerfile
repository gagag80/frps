# 使用 Alpine 作为基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 复制可执行文件和配置文件到容器
COPY frps /app/frps
COPY frps.ini /app/frps.ini

# 赋予执行权限
RUN chmod +x /app/frps

# 暴露必要的端口（根据 frps.ini 的配置）
EXPOSE 80

# 启动命令
CMD ["/app/frps", "-c", "/app/frps.ini"]
