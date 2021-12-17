FROM rocker/r-ver:4.1.2

ENV S6_VERSION=v2.1.0.2
ENV DEFAULT_USER=rstudio
ENV RSTUDIO_VERSION=1.4.1106
ENV PATH=/usr/lib/rstudio-server/bin:$PATH

RUN /rocker_scripts/install_rstudio.sh
RUN /rocker_scripts/install_pandoc.sh

EXPOSE 8787

CMD ["/init"]