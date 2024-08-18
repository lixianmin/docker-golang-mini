# 使用 Alpine Linux 作为运行时镜像
FROM alpine:latest

# The alpine images don't have some tools like (`vim` and `bash`).
RUN apk update && apk upgrade && \
    apk add --no-cache bash busybox-extras curl tzdata vim-full && \
    rm -rf /var/cache/apk/*

RUN echo "set number" >> /etc/vim/vimrc

# 修改时区为东8区，参考链接：https://game404.github.io/post/docker-timezone/
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
