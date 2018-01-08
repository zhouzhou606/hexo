FROM ubuntu

RUN apt-get update && apt-get install -y curl

# https://hexo.io/docs/index.html
# hexo io suggested steps: 

# 1. using nvm official install.sh
RUN curl -o- \
    https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# 2. install stable version
RUN export NVM_DIR=$HOME/.nvm; \
    [ -s $NVM_DIR/nvm.sh ] && \. $NVM_DIR/nvm.sh; \
    nvm install stable; \
    npm install -g hexo-cli; \
    hexo init blog

EXPOSE 4000

CMD export NVM_DIR=$HOME/.nvm; \
    [ -s $NVM_DIR/nvm.sh ] && \. $NVM_DIR/nvm.sh; \
    cd blog && hexo server

