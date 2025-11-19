FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    curl \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/pjreddie/darknet.git /opt/darknet
WORKDIR /opt/darknet

RUN sed -i 's/OPENCV=0/OPENCV=1/' Makefile

RUN make

RUN wget https://pjreddie.com/media/files/yolov3.weights

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
