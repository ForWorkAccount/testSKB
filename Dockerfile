FROM ubuntu:latest
RUN apt-get update && apt-get install -y nginx wget
RUN wget https://github.com/prometheus/node_exporter/releases/download/v1.8.1/node_exporter-1.8.1.linux-amd64.tar.gz \
    && tar -xvf node_exporter-1.8.1.linux-amd64.tar.gz \
    && mv node_exporter-1.8.1.linux-amd64/node_exporter /usr/local/bin/ \
    && rm -rf node_exporter-1.8.1.linux-amd64*
COPY node_exporter.yml /etc/prometheus/node_exporter.yml
CMD service nginx start && /usr/local/bin/node_exporter
