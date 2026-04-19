#!/bin/bash

set -ouex pipefail

# Install Envision Packages
## Runtime
dnf5 install -y \
    boost \
    librealsense \
    libuvc \
    onnxruntime \
    opencv \
    opencv-video \
    openhmd \
    openvr-api \
    openxr-libs

## WiVRn
dnf5 install -y \
    android-tools \
    avahi-devel \
    avahi-glib-devel \
    clang19-devel \
    cli11-devel \
    cmake \
    gcc-c++ \
    glslang-devel \
    glslc \
    gstreamer1-devel \
    json-devel \
    libarchive-devel \
    libnotify-devel \
    librsvg2-devel \
    libva-devel \
    openxr-devel \
    pipewire-devel

## Monado
dnf5 install -y \
    cmake \
    gcc-c++ \
    glslang-devel \
    glslc \
    libbsd-devel \
    libusb1 \
    libusb1-devel \
    openxr-devel \
    wayland-protocols-devel

## WMR
dnf5 install -y \
    fmt-devel \
    git-lfs \
    gtest-devel \
    jq \
    lz4-devel \
    tbb-devel
