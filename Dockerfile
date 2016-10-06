FROM debian:stable

MAINTAINER Alan Bennett <alan.bennett@linaro.org>
LABEL Version="0.1" Description="Container for compiling documents"

#install dependencies for sphinx, pip and git (from where to fetch code from)
RUN apt-get update && apt-get install -y python-pip python-sphinx latexdiff \
    texlive texlive-latex-extra texlive-humanities \
    texlive-generic-recommended graphviz git
RUN rm -rf /var/lib/apt-lists/*

RUN pip install --user --upgrade Sphinx

#if you don't pass in a REPO variable, just run bash, else build, copy and exit
CMD mkdir -p /root/output/sphinx-build && \
    if [ -z "$REPO" ]; then bash ; \
    else git clone $REPO workdir; cd workdir; \
      make latexpdf; cp build/latex/*.pdf /root/output/sphinx-build/; \
    fi
