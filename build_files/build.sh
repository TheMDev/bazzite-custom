#!/bin/bash

set -ouex pipefail

# /opt directory fix
mkdir -p /var/opt

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
    zsh

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

### Install from copr
# dnf5 copr enable user/project
# dnf5 install -y \
#     r2modman

### Install Kopia
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/kopia.repo
dnf5 install -y kopia-ui
mv /opt/KopiaUI /usr/lib/opt/KopiaUI

### Install VSCode
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/vscode.repo
dnf5 install -y code
