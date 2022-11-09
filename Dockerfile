from nvidia/cuda:11.1-cudnn8-runtime-ubuntu18.04
RUN apt-get update && \
    apt-get install -y wget git &&\
    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
ENV PATH /opt/miniconda/bin:$PATH
RUN mkdir -p /opt/miniconda && \
    sh miniconda.sh -bfp /opt/miniconda && \
    rm miniconda.sh && \
    rm -r /opt/miniconda/pkgs && \
    /bin/bash -c "source /opt/miniconda/bin/activate" && conda init &&\
    conda install python=3.7 && pip install ont-bonito==0.3.2 -i https://pypi.doubanio.com/simple

