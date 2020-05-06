FROM alpine:latest
LABEL maintainer="cazzaniga.sandro@gmail.com" \
      description="A simple quote API written in Perl"

RUN apk add --update --no-cache --virtual .build-deps git make perl-dev \
    && apk add perl \ 
    && echo | cpan \ 
    && git clone https://github.com/Kharec/quote-api.git /quote-api \
    && cpan Mojolicious::Lite Fortune Mojo::Server::Daemon \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/* /root/.cpan*

EXPOSE 8080

RUN cp /quote-api/startup.sh /usr/local/bin/startup

CMD ["/usr/local/bin/startup"]
