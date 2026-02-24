#!/bin/bash

set -ouex pipefail

# /opt directory fix
mkdir -p /var/opt

### Install from copr
# dnf5 copr enable -y user/project
dnf5 copr enable -y mdwagner/mutter
dnf5 copr enable -y ublue-os/bazzite-multilib

# Remove Bazzite's Package Version Lock
# dnf5 versionlock delete package
# dnf5 swap -y --repo=copr:copr.fedorainfracloud.org:mdwagner:package package package-version.fcXX.x86_64

### Install packages
dnf5 install -y \
    android-tools \
    btrfsmaintenance \
    cockpit \
    cockpit-files \
    cockpit-machines \
    cockpit-ostree \
    cockpit-podman \
    containernetworking-plugins \
    fedpkg \
    flatpak-builder \
    glib2-devel \
    nodejs \
    podman-compose \
    podman-machine \
    podman-tui \
    qemu-kvm \
    sysprof \
    tiptop \
    usbmuxd \
    wireguard-tools \
    zsh

### Install Envision Packages
#### Runtime
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

#### WiVRn
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
    gstreamer1-plugins-base-devel \
    json-devel \
    libarchive-devel \
    libnotify-devel \
    librsvg2-devel \
    libva-devel \
    openxr-devel \
    pipewire-devel

#### Monado
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

#### WMR
dnf5 install -y \
    fmt-devel \
    git-lfs \
    gtest-devel \
    jq \
    lz4-devel \
    tbb-devel

### Install gnome extensions
dnf5 install -y \
    gnome-shell-extension-apps-menu \
    gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-dash-to-panel \
    gnome-shell-extension-drive-menu \
    gnome-shell-extension-launch-new-instance \
    gnome-shell-extension-places-menu \
    gnome-shell-extension-user-theme \
    gnome-shell-extension-window-list

/ctx/build_files/build-gnome-extensions

### Remove Bazzite gnome extensions
rm -rf /usr/share/gnome-shell/extensions/block-caribou-36@lxylxy123456.ercli.dev
rm -rf /usr/share/gnome-shell/extensions/burn-my-windows@schneegans.github.com
rm -rf /usr/share/gnome-shell/extensions/compiz-windows-effect@hermes83.github.com
rm -rf /usr/share/gnome-shell/extensions/compiz-alike-magic-lamp-effect@hermes83.github.com
rm -rf /usr/share/gnome-shell/extensions/desktop-cube@schneegans.github.com
rm -rf /usr/share/gnome-shell/extensions/hotedge@jonathan.jdoda.ca

### Install Kopia
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/kopia.repo
dnf5 install -y kopia-ui
mv /opt/KopiaUI /usr/lib/opt/KopiaUI

### Install VSCode
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/vscode.repo
dnf5 install -y code
