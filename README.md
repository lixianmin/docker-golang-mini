#### docker-golang-mini



现在这个是需要自己build完成后自己上传到docker hub了



```shell
# 首先安装docker desktop，然后登录
brew install --cask docker

# 然后自己build一个image，再上传
docker build -t lixianmin/golang-mini:latest .
docker push lixianmin/golang-mini:latest
```

