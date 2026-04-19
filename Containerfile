ARG BASE_IMAGE

FROM scratch AS ctx

COPY build_files /build_files
COPY repo_files /repo_files

FROM ${BASE_IMAGE}

ARG IMAGE_NAME="${IMAGE_NAME:-bazzite-custom}"

COPY system_files/desktop/shared \
     system_files/desktop/silverblue \
     /

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/run \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build.sh && \
    /ctx/build_files/cleanup.sh

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/run \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build-envision.sh && \
    /ctx/build_files/cleanup.sh

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/run \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build-gnome-extensions.sh && \
    /ctx/build_files/cleanup.sh && \
    bootc container lint
