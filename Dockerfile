FROM fluent/fluentd:v1.14-debian-1
MAINTAINER YOUR_NAME <...@...>

COPY *.gem /tmp/
USER root

RUN buildDeps="sudo make gcc g++ libc-dev" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && fluent-gem install --force --local /tmp/*.gem \
 && sudo gem sources --clear-all \
 && SUDO_FORCE_REMOVE=yes \
    apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY fluent.conf /fluentd/etc/
COPY entrypoint.sh /bin/
RUN mkdir -p /fluentd/log/elastic-buffer
RUN chown -R fluent:fluent /fluentd/log/elastic-buffer

USER fluent
