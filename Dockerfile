FROM debian:stable

MAINTAINER Alan Bennett <alan.bennett@linaro.org>
LABEL Version="0.1" Description="Container for compiling documents"

RUN apt-get update && apt-get install -y python-pip python-sphinx latexdiff \
    texlive texlive-latex-extra texlive-humanities \
    texlive-generic-recommended graphviz
RUN apt-get install -y git
RUN rm -rf /var/lib/apt-lists/*

RUN pip install --user --upgrade Sphinx

ENV SPHINXBUIILD=/root/output/sphinx-build

CMD mkdir -p /root/output/sphinx-build && \
    if [ -z "$REPO" ]; then bash ; \
    else git clone $REPO workdir; cd workdir; \
      make latexpdf; cp build/latex/*.pdf /root/output/sphinx-build/; \
    fi
