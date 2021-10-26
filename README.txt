docker build -t custom-fluentd:latest ./
docker tag custom-fluentd:latest ic3cool/custom-fluentd:latest
docker push ic3cool/custom-fluentd:latest


docker run -p 24224:24224 -p 1514:1514 -p 1515:1515/udp -u root -it --rm --name custom-docker-fluent-logger -v $(pwd)/log:/fluentd/log -v $(pwd)/testconf/fluent.conf:/fluentd/etc/fluent.conf:ro -e TZ=Europe/Stockholm ic3cool/custom-fluentd:latest