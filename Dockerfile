FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu16.04
RUN apt update && apt install -y vim
ADD conda.sh /root/
ENV CONDA_DIR /opt/conda
ENV PATH ${CONDA_DIR}/bin:$PATH
RUN echo "[global]" >> /etc/pip.conf && \
    echo "index-url = https://pypi.douban.com/simple" >> /etc/pip.conf
RUN /bin/bash ~/conda.sh -b -p $CONDA_DIR && \
    rm ~/conda.sh && \
    mkdir ~/.pip && \
    echo "[global]" >> ~/.pip/pip.conf && \
    echo "index-url = https://pypi.douban.com/simple" >> ~/.pip/pip.conf && \
    conda init
WORKDIR /root
CMD /bin/bash
