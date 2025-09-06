ARG BASE_IMAGE

FROM scratch AS ctx

COPY build_files /build_files
COPY repo_files /repo_files
COPY spec_files /spec_files
COPY system_files /system_files

FROM ${BASE_IMAGE}

ARG IMAGE_NAME="${IMAGE_NAME:-bazzite-custom}"

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_files/build.sh

RUN bootc container lint