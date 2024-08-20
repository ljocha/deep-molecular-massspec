# latest with cuda 11.8; required at A100, 12.0 is broken there
FROM nvcr.io/nvidia/tensorflow:22.12-tf1-py3

RUN mkdir -p /opt/neims
COPY *.py /opt/neims

RUN pip install rdkit
