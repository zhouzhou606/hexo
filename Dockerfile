FROM ubuntu

RUN apt-get update && apt-get install -y curl

ENV POSTS_DIR=/blog/source/_posts

# 1. install nvm
RUN curl -o- \
    https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# 2. install stable version
RUN export NVM_DIR=$HOME/.nvm; \
    [ -s $NVM_DIR/nvm.sh ] && \. $NVM_DIR/nvm.sh; \
    nvm install stable; \
    npm install -g hexo-cli; \
    hexo init blog

COPY demo.md $POSTS_DIR

VOLUME $POSTS_DIR

EXPOSE 4000

CMD export NVM_DIR=$HOME/.nvm; \
    [ -s $NVM_DIR/nvm.sh ] && \. $NVM_DIR/nvm.sh; \
    cd blog && hexo server

