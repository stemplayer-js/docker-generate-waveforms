FROM genesix/docker-audiowaveform-alpine as audiowaveform-builder

COPY scripts /scripts
RUN chmod +x /scripts/entrypoint.sh

WORKDIR /workdir

CMD [ "-help" ]
ENTRYPOINT ["/scripts/entrypoint.sh"]
