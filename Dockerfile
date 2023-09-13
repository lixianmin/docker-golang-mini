# 后续, 记得golang最好不要使用最新版本, 晚一个版本有利于生态展开
# 执行./build.image.sh打包并上传本镜像
FROM golang:1.20.8-alpine

# The latest alpine images don't have some tools like (`git` and `bash`).
# Adding git, bash and openssh to the image
RUN apk update && apk upgrade && \
    apk add --no-cache bash build-base busybox-extras curl gcc git tzdata vim

# 修改时区为东8区，参考链接：https://game404.github.io/post/docker-timezone/
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

