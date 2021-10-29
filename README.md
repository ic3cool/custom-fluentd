# custom-fluentd
docker build -t custom-fluentd:latest ./
docker build -t custom-fluentd:0.14.2 ./
docker tag custom-fluentd:latest ic3cool/custom-fluentd:latest
docker tag custom-fluentd:latest ic3cool/custom-fluentd:7.14.2
docker push ic3cool/custom-fluentd:latest
docker push ic3cool/custom-fluentd:7.14.2
