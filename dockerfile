FROM ubuntu:22.04
RUN	apt update && \
apt -y install wget bzip2 xz-utils lib32z1 cmake vim 


RUN wget https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
RUN tar -C /usr/local/ -xvf go1.22.1.linux-amd64.tar.gz

RUN echo "export PATH=\$PATH:/usr/local/go/bin" > /etc/profile
ENV PATH=$PATH:/usr/local/go/bin
RUN go version

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.51.0-rc.0/prometheus-2.51.0-rc.0.linux-amd64.tar.gz

RUN tar -C /usr/local/ -xvf prometheus-2.51.0-rc.0.linux-amd64.tar.gz

RUN ln -sv /usr/local/prometheus-2.51.0-rc.0.linux-amd64/ /usr/local/Prometheus
COPY  prometheus.yml /usr/local/Prometheus/prometheus.yml
RUN /usr/local/Prometheus/prometheus --config.file=/usr/local/Prometheus/prometheus.yml &
