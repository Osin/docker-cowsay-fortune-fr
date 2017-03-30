FROM osin/base:latest
RUN apt-get install fortunes fortunes-fr make cowsay -yq
WORKDIR tmp
RUN wget -c https://www.fortunes-fr.org/fortunes-fr/fortunes-fr-0.02.tar.gz && tar -xvf fortunes-fr-0.02.tar.gz
WORKDIR /tmp/fortunes-fr-0.02
RUN ./configure && make && make install
WORKDIR /
RUN rm -rf /tmp/fortunes-fr-0.02
COPY docker.cow /usr/share/cowsay/cows/docker.cow
ENV cowformat docker
ENV fortuneformat fr
COPY start.sh /start.sh
ENTRYPOINT ["/start.sh"]
CMD ["fr", "docker"]
