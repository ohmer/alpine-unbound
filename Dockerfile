# syntax=docker/dockerfile:1

# hadolint ignore=DL3006
FROM base AS unbound

ARG PUID=53
ARG PGID=53

# hadolint ignore=DL3018
RUN set -eux; \
    \
    apk --no-cache add shadow; \
    groupadd --system --gid "$PUID" unbound; \ 
    useradd --system --gid "$PUID" --uid "$PUID" --create-home --home-dir /etc/unbound --shell /sbin/nologin unbound; \
    apk del shadow; \
    \
    apk --no-cache add openssl unbound


# hadolint ignore=DL3022
COPY --from=root /etc/s6-overlay /etc/s6-overlay
RUN chmod -R u=rwX,go=rX /etc/s6-overlay

ENV S6_CMD_RECEIVE_SIGNALS=1
CMD ["fdmove", "-c", "2", "1", "unbound", "-d", "-p"]
