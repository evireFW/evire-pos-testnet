FROM ethereum/client-go:latest


COPY genesis.json /genesis.json
COPY init-and-run.sh /init-and-run.sh


RUN chmod +x /init-and-run.sh


WORKDIR /root


EXPOSE 8545 8546 8547 30303 30303/udp


ENTRYPOINT ["/init-and-run.sh"]
