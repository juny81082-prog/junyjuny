FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pjreddie/darknet.git /opt/darknet
WORKDIR /opt/darknet

# 기본 설정(GPU=0, OPENCV=0) 그대로 빌드
RUN make

RUN wget https://pjreddie.com/media/files/yolov3.weights

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
