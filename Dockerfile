FROM ubuntu
ENV tlInstall="install-tl-unx"
ENV tlVersion="2024"
ENV platform="x86_64-linux"
# Download TexLive installation file
WORKDIR /tmp
RUN apt-get update
RUN apt-get -y install wget
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/${tlInstall}.tar.gz
RUN zcat < ${tlInstall}.tar.gz | tar xf -
RUN mv install-tl-2*/ install-latex    
WORKDIR ./install-latex
RUN apt-get -y install perl-modules
RUN perl install-tl --no-interaction
RUN export PATH=/usr/local/texlive/${tlVersion}/bin/${platform}:${PATH}
WORKDIR /home/root
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]