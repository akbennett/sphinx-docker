# use the OSF minideb for multi-arch images 
FROM opensourcefoundries/minideb:stretch

MAINTAINER Alan Bennett <alan.bennett@linaro.org>
LABEL Version="0.1" Description="Container for compiling documents"

#install dependencies for sphinx, pip and git
RUN install_packages build-essential latexdiff \
    python3-pip python3-sphinx python3-markupsafe \
    texlive texlive-latex-extra texlive-humanities \
    texlive-generic-recommended graphviz git

RUN pip3 install wheel \
    && pip3 install setuptools \
    && pip3 install --user --upgrade Sphinx \
    && pip3 install sphinx_rtd_theme

#if you don't pass in a REPO variable, just run bash, else build, copy and exit
CMD mkdir -p /root/output/sphinx-build && \
    if [ -z "$REPO" ]; then bash ; \
    else git clone $REPO workdir; cd workdir; \
      make latexpdf; cp build/latex/*.pdf /root/output/sphinx-build/; \
    fi
