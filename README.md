# custom-fluentd \
docker build -t custom-fluentd:latest ./ \
docker build -t custom-fluentd:1.14-debian-1_1 ./ \
docker tag custom-fluentd:latest ic3cool/custom-fluentd:latest \
docker tag custom-fluentd:latest ic3cool/custom-fluentd:1.14-debian-1_1 \
docker push ic3cool/custom-fluentd:latest \
docker push ic3cool/custom-fluentd:1.14-debian-1_1 \
