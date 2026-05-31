#!/bin/bash

set -eoux pipefail

echo "::group::Installing Developer Packages"
trap 'echo "::endgroup::"' EXIT

# /opt directory fix
mkdir -p /var/opt

# Copy system files to root
cp  -r \
    /ctx/system_files/desktop/shared/* \
    /ctx/system_files/desktop/silverblue/* \
    /

# Install from copr
## dnf5 copr enable -y user/project
# dnf5 copr enable -y mdwagner/mutter
dnf5 copr enable -y ublue-os/bazzite
dnf5 copr enable -y ublue-os/bazzite-multilib

# Remove Bazzite's package version lock
# dnf5 versionlock delete package
# dnf5 swap -y --repo=copr:copr.fedorainfracloud.org:mdwagner:package package package-version.fcXX.x86_64

# Install Kopia
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/kopia.repo
dnf5 install -y kopia-ui
mv /opt/KopiaUI /usr/lib/opt/KopiaUI

# Install VSCode
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/vscode.repo
dnf5 install -y code

# Install Bazzite DX Packages
dnf5 install -y \
    android-tools \
    bcc \
    bpftop \
    bpftrace \
    flatpak-builder \
    podman-compose \
    podman-machine \
    podman-tui \
    sysprof \
    tiptop \
    usbmuxd \
    waypipe \
    zsh

# Install Bazzite DX Virt Packages
dnf5 install -y \
    guestfs-tools \
    libvirt \
    qemu \
    qemu-kvm \
    virt-manager

# Install Custom DX Packages
dnf5 install -y \
    btrfsmaintenance \
    cmake \
    cockpit \
    cockpit-files \
    cockpit-machines \
    cockpit-ostree \
    cockpit-podman \
    containernetworking-plugins \
    fedpkg \
    gcc \
    gcc-c++ \
    git-lfs \
    wireguard-tools

# TODO
# echo "import \"/usr/share/mdev-os/custom.just\"" >>/usr/share/ublue-os/justfile
