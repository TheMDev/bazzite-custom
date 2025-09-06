#!/bin/bash

set -ouex pipefail

# /opt directory fix
mkdir -p /var/opt

### Install packages
dnf5 install -y \
    android-tools \
    btrfsmaintenance \
    containernetworking-plugins \
    flatpak-builder \
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
    gnome-shell-extension-drive-menu

### Install from copr
# dnf5 copr enable user/project
# dnf5 install -y \
#     r2modman \
#     gnome-shell-extension-advanced-alttab-window-switcher \
#     gnome-shell-extension-vertical-workspaces \
#     gnome-shell-extension-window-thumbnails \
#     gnome-shell-extension-workspace-switcher-manager

### Install Kopia
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/kopia.repo
dnf5 install -y kopia-ui
mv /opt/KopiaUI /usr/lib/opt/KopiaUI
cp -f /ctx/system_files/usr/lib/tmpfiles.d/kopia-ui.conf /usr/lib/tmpfiles.d/
cp -f /ctx/system_files/usr/share/applications/kopia-ui.desktop /usr/share/applications/kopia-ui.desktop

### Install VSCode
dnf5 config-manager addrepo --from-repofile=/ctx/repo_files/vscode.repo
dnf5 install -y code
