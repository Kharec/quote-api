FROM alpine:latest
LABEL maintainer="cazzaniga.sandro@gmail.com" \
      description="A simple quote API written in Perl"

RUN apk add --update --no-cache --virtual .build-deps git perl-dev \
    apk add perl \ 
    echo | cpan \ 
    git clone https://github.com/Kharec/quote-api.git /quote-api \
    cpan Mojolicious::Lite Fortune Mojo::Server::Daemon \

