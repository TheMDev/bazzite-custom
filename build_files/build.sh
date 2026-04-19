#!/bin/bash

set -eoux pipefail

# /opt directory fix
mkdir -p /var/opt

# Install from copr
## dnf5 copr enable -y user/project
dnf5 copr enable -y mdwagner/mutter
dnf5 copr enable -y ublue-os/bazzite-multilib

# Remove Bazzite's Package Version Lock
# dnf5 versionlock delete package
# dnf5 swap -y --repo=copr:copr.fedorainfracloud.org:mdwagner:package package package-version.fcXX.x86_64

# Install Kopia
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/kopia.repo
dnf5 install -y kopia-ui
mv /opt/KopiaUI /usr/lib/opt/KopiaUI

# Install VSCode
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/vscode.repo
dnf5 install -y code

# Install packages
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
    libvirt \
    podman-compose \
    podman-machine \
    podman-tui \
    qemu \
    qemu-kvm \
    sysprof \
    tiptop \
    usbmuxd \
    virt-manager \
    waypipe \
    wireguard-tools \
    zsh

# TODO
# echo "import \"/usr/share/mdev-os/custom.just\"" >>/usr/share/ublue-os/justfile
