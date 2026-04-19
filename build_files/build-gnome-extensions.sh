#!/bin/bash

set -eoux pipefail

echo "::group::Installing Gnome Shell Extensions"
trap 'echo "::endgroup::"' EXIT

# Variables for gnome shell extension installs
NAME_GNOME_SHELL_EXTENSION=""
PATH_REPO_GNOME_SHELL_EXTENSION="/ctx/system_modules/desktop/silverblue/usr/share/gnome-shell/extensions"
PATH_ROOT_GNOME_SHELL_EXTENSION="/usr/share/gnome-shell/extensions"
PATH_TEMP_GNOME_SHELL_EXTENSION="/tmp/gnome-shell-extensions"

# Copy gnome shell extension submodules to temporary build directory
mkdir -p ${PATH_TEMP_GNOME_SHELL_EXTENSION}
cp  -r \
    ${PATH_REPO_GNOME_SHELL_EXTENSION}/* \
    ${PATH_TEMP_GNOME_SHELL_EXTENSION}

# Remove Bazzite gnome extensions
rm -rf ${PATH_ROOT_GNOME_SHELL_EXTENSION}/block-caribou-36@lxylxy123456.ercli.dev
rm -rf ${PATH_ROOT_GNOME_SHELL_EXTENSION}/burn-my-windows@schneegans.github.com
rm -rf ${PATH_ROOT_GNOME_SHELL_EXTENSION}/compiz-windows-effect@hermes83.github.com
rm -rf ${PATH_ROOT_GNOME_SHELL_EXTENSION}/compiz-alike-magic-lamp-effect@hermes83.github.com
rm -rf ${PATH_ROOT_GNOME_SHELL_EXTENSION}/desktop-cube@schneegans.github.com
rm -rf ${PATH_ROOT_GNOME_SHELL_EXTENSION}/hotedge@jonathan.jdoda.ca

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
NAME_GNOME_SHELL_EXTENSION="advanced-alt-tab@G-dH.github.com"
make zip -C ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
unzip -o ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}.zip \
      -d ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## App Indicator Support
# N/A

## Bazaar Integration
# N/A

## Blur My Shell
# NAME_GNOME_SHELL_EXTENSION="blur-my-shell@aunetx"
# make -C ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
# unzip -o ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/build/${NAME_GNOME_SHELL_EXTENSION}.shell-extension.zip \
#       -d ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Caffeine
# N/A

## Dash to Dock
NAME_GNOME_SHELL_EXTENSION="dash-to-dock@micxgx.gmail.com"
npm install eslint@9.x \
      --cache /var/cache \
      --prefix /tmp/
make zip-file -C ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION} ESLINT=/tmp/node_modules/eslint/bin/eslint.js
unzip -o ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}.zip \
      -d ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Dash to Panel
NAME_GNOME_SHELL_EXTENSION="dash-to-panel@jderose9.github.com"
make zip-file -C ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
unzip -o ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}.zip \
      -d ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Display Brightness ddcutil
NAME_GNOME_SHELL_EXTENSION="display-brightness-ddcutil@themightydeity.github.com"
make all -C ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
unzip -o ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/dist/${NAME_GNOME_SHELL_EXTENSION}.shell-extension.zip \
      -d ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Logo Menu
# N/A

## Multi Monitor Bar
NAME_GNOME_SHELL_EXTENSION="multi-monitors-bar@frederykabryan"
cp -r ${PATH_REPO_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION} \
      ${PATH_ROOT_GNOME_SHELL_EXTENSION}/

## Quick Settings Audio Devices Hider
NAME_GNOME_SHELL_EXTENSION="quicksettings-audio-devices-hider@marcinjahn.com"
npm install \
      --cache /var/cache \
      --prefix ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
npm run build \
      --cache /var/cache \
      --prefix ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
mkdir -p ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
cp -r ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/dist/* \
      ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Quick Settings Audio Devices Renamer
NAME_GNOME_SHELL_EXTENSION="quicksettings-audio-devices-renamer@marcinjahn.com"
npm install \
      --cache /var/cache \
      --prefix ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
npm run build \
      --cache /var/cache \
      --prefix ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
mkdir -p ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
cp -r ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/dist/* \
      ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Restart To
# N/A

## Tiling Shell
NAME_GNOME_SHELL_EXTENSION="tilingshell@ferrarodomenico.com"
npm install \
      --legacy-peer-deps \
      --cache /var/cache \
      --prefix ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
npm run build \
      --cache /var/cache \
      --prefix ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
mkdir -p ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
cp -r ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/dist/* \
      ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Vertical Workspaces
NAME_GNOME_SHELL_EXTENSION="vertical-workspaces@G-dH.github.com"
make zip -C ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
unzip -o ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}.zip \
      -d ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Window Thumbnails
NAME_GNOME_SHELL_EXTENSION="window-thumbnails@G-dH.github.com"
make zip -C ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
unzip -o ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}.zip \
      -d ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

## Workspace Switcher Manager
NAME_GNOME_SHELL_EXTENSION="workspace-switcher-manager@G-dH.github.com"
make zip -C ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}
unzip -o ${PATH_TEMP_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}.zip \
      -d ${PATH_ROOT_GNOME_SHELL_EXTENSION}/${NAME_GNOME_SHELL_EXTENSION}

# Move extension schemas so they are available to dconf & gsettings
mv  ${PATH_ROOT_GNOME_SHELL_EXTENSION}/*/schemas/*.gschema.xml \
    /usr/share/glib-2.0/schemas

# Preprocessor for gschema overides to allow multi-line strings
sed -i -z 's/\\\n//g' /usr/share/glib-2.0/schemas/zz1-*.gschema.override

# Compile system schemas
glib-compile-schemas /usr/share/glib-2.0/schemas &>/dev/null

# Cleanup
rm -rf ${PATH_ROOT_GNOME_SHELL_EXTENSION}/*/schemas
