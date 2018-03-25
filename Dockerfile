FROM jupyter/datascience-notebook
LABEL maintainer="S.Nakano(j15322sn@gmail.com)"

USER root

RUN apt-get update -y --fix-missing && \
    apt-get install -y \
    xz-utils \
    file \
    mecab \
    libmecab-dev \
    mecab-ipadic-utf8

WORKDIR /tmp
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
WORKDIR /tmp/mecab-ipadic-neologd
RUN ./bin/install-mecab-ipadic-neologd -n -y

RUN conda install --quiet --yes \
    gensim \
    natto-py

USER $NB_UID