#!/bin/bash

set -eoux pipefail

echo "::group::Installing Envision Packages"
trap 'echo "::endgroup::"' EXIT

# Remove Bazzite Version Locks
dnf5 versionlock delete \
    bluez \
    bluez-cups \
    bluez-libs \
    bluez-obexd \
    mesa-dri-drivers \
    mesa-filesystem \
    mesa-libEGL \
    mesa-libGL \
    mesa-libgbm \
    mesa-vulkan-drivers \
    pipewire \
    pipewire-alsa \
    pipewire-gstreamer \
    pipewire-jack-audio-connection-kit \
    pipewire-jack-audio-connection-kit-libs \
    pipewire-libs \
    pipewire-plugin-libcamera \
    pipewire-pulseaudio \
    pipewire-utils

# Bazzite tries to prevent fedora repos from overriding
# terra-mesa repos but unintentionally blocks mesa-libGLU-devel
# dnf5 -y config-manager setopt "*fedora*".exclude="mesa-*
dnf5 install -y \
    --setopt=disable_excludes=fedora \
    mesa-libGLU-devel

# Install Envision Dependencies From Fedora Multimedia
dnf5 install -y \
    --enable-repo="fedora-multimedia" \
    ffmpeg-devel \
    x264-devel

# Install Envision Dependencies From Terra Mesa
dnf5 install -y \
    --enable-repo="terra-mesa" \
    mesa-libEGL-devel \
    mesa-libgbm-devel \
    mesa-libGL-devel

# Install Envision Packages
dnf5 install -y \
    envision-wivrn \
    envision-monado \
    `# WMR` \
    fmt-devel \
    glew-devel \
    gtest-devel \
    jq \
    lz4-devel \
    tbb-devel
