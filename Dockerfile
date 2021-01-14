RUN apt-get update && \
    apt-get install -y wget git &&\
    wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
ENV PATH /opt/miniconda/bin:$PATH
RUN mkdir -p /opt/miniconda && \
    sh miniconda.sh -bfp /opt/miniconda && \
    #ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/ && \
    #echo ". /opt/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    rm miniconda.sh && \
    rm -r /opt/miniconda/pkgs && \
    #echo "export PATH=/opt/conda/bin:$PATH" >> ~/.bashrc &&\
    /bin/bash -c "source /opt/miniconda/bin/activate" && conda init &&\
    conda install python=3.7

RUN pip3 install ont-bonito==0.3.2 -i https://pypi.doubanio.com/simple

