# 使用 Alpine 作为基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 复制可执行文件到容器
COPY frps /app/frps

# 赋予执行权限
RUN chmod +x /app/frps

# 安装必要的依赖（如 SSL/TLS 支持）
RUN apk add --no-cache libc6-compat openssl

# 启动时动态生成配置文件并启动服务
CMD sh -c "echo -e '{\n  \"common\": {\n    \"bind_port\": \"${PORT}\",\n    \"dashboard_addr\": \"0.0.0.0\",\n    \"dashboard_port\": \"${PORT}\",\n    \"dashboard_user\": \"admin\",\n    \"dashboard_pwd\": \"password\"\n  }\n}' > /app/frps.json && /app/frps -c /app/frps.json --config_format=json"
