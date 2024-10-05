# 使用 Alpine Linux 作为运行时镜像
FROM alpine:latest

# substitute respoistory
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

# The alpine images don't have some tools like (`vim` and `bash`).
# remove --no-cache
RUN apk update && apk upgrade && \
    apk add bash busybox-extras curl tzdata vim && \
    rm -rf /var/cache/apk/*

# link to vim
RUN rm /usr/bin/vi
RUN ln -s /usr/bin/vim /usr/bin/vi

# init .vimrc
RUN echo "set expandtab" >> /root/.vimrc
RUN echo "set hlsearch" >> /root/.vimrc
RUN echo "set nocompatible" >> /root/.vimrc
RUN echo "set nu" > /root/.vimrc
RUN echo "set tabstop=4" >> /root/.vimrc
RUN echo "syntax on" >> /root/.vimrc

# 修改时区为东8区，参考链接：https://game404.github.io/post/docker-timezone/
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
