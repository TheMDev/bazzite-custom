#!/bin/bash

set -eoux pipefail

echo "::group::Installing Gnome Shell Extensions"
trap 'echo "::endgroup::"' EXIT

# Copy gnome shell extension submodules to temporary build directory
mkdir -p /tmp/gnome-shell-extensions
cp  -r \
    /ctx/system_modules/desktop/silverblue/usr/share/gnome-shell/extensions/* \
    /tmp/gnome-shell-extensions

# Remove Bazzite gnome extensions
rm -rf /usr/share/gnome-shell/extensions/block-caribou-36@lxylxy123456.ercli.dev
rm -rf /usr/share/gnome-shell/extensions/burn-my-windows@schneegans.github.com
rm -rf /usr/share/gnome-shell/extensions/compiz-windows-effect@hermes83.github.com
rm -rf /usr/share/gnome-shell/extensions/compiz-alike-magic-lamp-effect@hermes83.github.com
rm -rf /usr/share/gnome-shell/extensions/desktop-cube@schneegans.github.com
rm -rf /usr/share/gnome-shell/extensions/hotedge@jonathan.jdoda.ca

# Install gnome extension dependencies
dnf5 install -y \
    gettext \
    glib2-devel \
    nodejs \
    nodejs-npm \
    sassc

# Install gnome extensions
dnf5 install -y \
    gnome-shell-extension-apps-menu \
    gnome-shell-extension-drive-menu \
    gnome-shell-extension-places-menu \
    gnome-shell-extension-user-theme \
    gnome-shell-extension-window-list

# Build Extensions

## Add to Steam
# N/A

## Advanced Alt Tab Window Switcher
make zip -C /tmp/gnome-shell-extensions/advanced-alt-tab@G-dH.github.com
unzip -o /tmp/gnome-shell-extensions/advanced-alt-tab@G-dH.github.com/advanced-alt-tab@G-dH.github.com.zip \
      -d /usr/share/gnome-shell/extensions/advanced-alt-tab@G-dH.github.com

## App Indicator Support
# N/A

## Bazaar Integration
# N/A

## Blur My Shell
# make -C /usr/share/gnome-shell/extensions/blur-my-shell@aunetx
# unzip -o /usr/share/gnome-shell/extensions/blur-my-shell@aunetx/build/blur-my-shell@aunetx.shell-extension.zip \
# -d /usr/share/gnome-shell/extensions/blur-my-shell@aunetx
# rm -rf /usr/share/gnome-shell/extensions/blur-my-shell@aunetx/build

## Caffeine
# N/A

## Dash to Dock
npm install eslint@9.x \
      --cache /var/cache \
      --prefix /tmp/
make zip-file -C /tmp/gnome-shell-extensions/dash-to-dock@micxgx.gmail.com ESLINT=/tmp/node_modules/eslint/bin/eslint.js
unzip -o /tmp/gnome-shell-extensions/dash-to-dock@micxgx.gmail.com/dash-to-dock@micxgx.gmail.com.zip \
      -d /usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com

## Dash to Panel
make zip-file -C /tmp/gnome-shell-extensions/dash-to-panel@jderose9.github.com
unzip -o /tmp/gnome-shell-extensions/dash-to-panel@jderose9.github.com/dash-to-panel@jderose9.github.com.zip \
      -d /usr/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com

## Display Brightness ddcutil
make all -C /tmp/gnome-shell-extensions/display-brightness-ddcutil@themightydeity.github.com
unzip -o /tmp/gnome-shell-extensions/display-brightness-ddcutil@themightydeity.github.com/dist/display-brightness-ddcutil@themightydeity.github.com.shell-extension.zip \
      -d /usr/share/gnome-shell/extensions/display-brightness-ddcutil@themightydeity.github.com

## Logo Menu
# N/A

## Multi Monitor Bar
cp -r /ctx/system_modules/desktop/silverblue/usr/share/gnome-shell/extensions/multi-monitors-bar@frederykabryan \
      /usr/share/gnome-shell/extensions/

## Quick Settings Audio Devices Hider
# TODO
npm install \
      --cache /var/cache \
      --prefix /tmp/gnome-shell-extensions/quicksettings-audio-devices-hider@marcinjahn.com
npm run build \
      --cache /var/cache \
      --prefix /tmp/gnome-shell-extensions/quicksettings-audio-devices-hider@marcinjahn.com
mkdir -p /usr/share/gnome-shell/extensions/quicksettings-audio-devices-hider@marcinjahn.com
cp -r /tmp/gnome-shell-extensions/quicksettings-audio-devices-hider@marcinjahn.com/dist/* \
      /usr/share/gnome-shell/extensions/quicksettings-audio-devices-hider@marcinjahn.com

## Quick Settings Audio Devices Renamer
# TODO
npm install \
      --cache /var/cache \
      --prefix /tmp/gnome-shell-extensions/quicksettings-audio-devices-renamer@marcinjahn.com
npm run build \
      --cache /var/cache \
      --prefix /tmp/gnome-shell-extensions/quicksettings-audio-devices-renamer@marcinjahn.com
mkdir -p /usr/share/gnome-shell/extensions/quicksettings-audio-devices-renamer@marcinjahn.com
cp -r /tmp/gnome-shell-extensions/quicksettings-audio-devices-renamer@marcinjahn.com/dist/* \
      /usr/share/gnome-shell/extensions/quicksettings-audio-devices-renamer@marcinjahn.com

## Restart To
# N/A

## Tiling Shell
# TODO
npm install \
      --legacy-peer-deps \
      --cache /var/cache \
      --prefix /tmp/gnome-shell-extensions/tilingshell@ferrarodomenico.com
npm run build \
      --cache /var/cache \
      --prefix /tmp/gnome-shell-extensions/tilingshell@ferrarodomenico.com
mkdir -p /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com
cp -r /tmp/gnome-shell-extensions/tilingshell@ferrarodomenico.com/dist/* \
      /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com

## Vertical Workspaces
make zip -C /tmp/gnome-shell-extensions/vertical-workspaces@G-dH.github.com
unzip -o /tmp/gnome-shell-extensions/vertical-workspaces@G-dH.github.com/vertical-workspaces@G-dH.github.com.zip \
      -d /usr/share/gnome-shell/extensions/vertical-workspaces@G-dH.github.com

## Window Thumbnails
make zip -C /tmp/gnome-shell-extensions/window-thumbnails@G-dH.github.com
unzip -o /tmp/gnome-shell-extensions/window-thumbnails@G-dH.github.com/window-thumbnails@G-dH.github.com.zip \
      -d /usr/share/gnome-shell/extensions/window-thumbnails@G-dH.github.com

## Workspace Switcher Manager
make zip -C /tmp/gnome-shell-extensions/workspace-switcher-manager@G-dH.github.com
unzip -o /tmp/gnome-shell-extensions/workspace-switcher-manager@G-dH.github.com/workspace-switcher-manager@G-dH.github.com.zip \
      -d /usr/share/gnome-shell/extensions/workspace-switcher-manager@G-dH.github.com

# TODO
mv \
    /usr/share/gnome-shell/extensions/add-to-steam@pupper.space/schemas/org.gnome.shell.extensions.add-to-steam.gschema.xml \
    /usr/share/gnome-shell/extensions/advanced-alt-tab@G-dH.github.com/schemas/org.gnome.shell.extensions.advanced-alt-tab-window-switcher.gschema.xml \
    /usr/share/gnome-shell/extensions/appindicatorsupport@rgcjonas.gmail.com/schemas/org.gnome.shell.extensions.appindicator.gschema.xml \
    /usr/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml \
    /usr/share/gnome-shell/extensions/caffeine@patapon.info/schemas/org.gnome.shell.extensions.caffeine.gschema.xml \
    /usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml \
    /usr/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com/schemas/org.gnome.shell.extensions.dash-to-panel.gschema.xml \
    /usr/share/gnome-shell/extensions/display-brightness-ddcutil@themightydeity.github.com/schemas/org.gnome.shell.extensions.display-brightness-ddcutil.gschema.xml \
    /usr/share/gnome-shell/extensions/logomenu@aryan_k/schemas/org.gnome.shell.extensions.logo-menu.gschema.xml \
    /usr/share/gnome-shell/extensions/multi-monitors-bar@frederykabryan/schemas/org.gnome.shell.extensions.multi-monitors-bar.gschema.xml \
    /usr/share/gnome-shell/extensions/quicksettings-audio-devices-hider@marcinjahn.com/schemas/org.gnome.shell.extensions.quicksettings-audio-devices-hider.gschema.xml \
    /usr/share/gnome-shell/extensions/quicksettings-audio-devices-renamer@marcinjahn.com/schemas/org.gnome.shell.extensions.quicksettings-audio-devices-renamer.gschema.xml \
    /usr/share/gnome-shell/extensions/restartto@tiagoporsch.github.io/schemas/org.gnome.shell.extensions.restartto.gschema.xml \
    /usr/share/gnome-shell/extensions/tilingshell@ferrarodomenico.com/schemas/org.gnome.shell.extensions.tilingshell.gschema.xml \
    /usr/share/gnome-shell/extensions/vertical-workspaces@G-dH.github.com/schemas/org.gnome.shell.extensions.vertical-workspaces.gschema.xml \
    /usr/share/gnome-shell/extensions/window-thumbnails@G-dH.github.com/schemas/org.gnome.shell.extensions.window-thumbnails.gschema.xml \
    /usr/share/gnome-shell/extensions/workspace-switcher-manager@G-dH.github.com/schemas/org.gnome.shell.extensions.workspace-switcher-manager.gschema.xml \
    /usr/share/glib-2.0/schemas

# TODO
sed -i -z 's/\\\n//g' /usr/share/glib-2.0/schemas/zz1-*.gschema.override

# TODO
glib-compile-schemas /usr/share/glib-2.0/schemas &>/dev/null

# Cleanup
rm -rf /usr/share/gnome-shell/extensions/*/schemas
rm -rf /usr/share/gnome-shell/extensions/tmp
