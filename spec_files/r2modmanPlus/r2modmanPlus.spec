%undefine _debugsource_packages
%global debug_package %{nil}

Name:           r2modman
Version:        3.2.3
Release:        2%{?dist}
Summary:        A simple and easy to use mod manager for many games using Thunderstore

License:        MIT
URL:            https://github.com/ebkr/r2modmanPlus
Source0:        %{name}-%{version}.tar.gz
Source1:        r2modman.desktop
Source2:        r2modman.metainfo.xml
Source3:        r2modman.png

BuildArch:      x86_64
#Requires:       electron #bundled

%description
r2modman is a simple and easy to use mod manager for many games using Thunderstore. It provides an Electron-based GUI to manage mods across different games and platforms.

(This is an unofficial build from the untouched source code)

%prep
%setup -q

%build
# No build needed – precompiled Electron app

%install
mkdir -p %{buildroot}/opt/%{name}
cp -a * %{buildroot}/opt/%{name}
# Install .desktop file
install -Dm0644 %{SOURCE1} %{buildroot}/usr/share/applications/r2modman.desktop

# Install metainfo file
install -Dm0644 %{SOURCE2} %{buildroot}/usr/share/metainfo/r2modman.metainfo.xml

# Optionally install icon (if exists)
install -Dm0644 %{SOURCE3} %{buildroot}/usr/share/icons/hicolor/256x256/apps/r2modman.png


# Create a symlink to launch the app
mkdir -p %{buildroot}/usr/bin
ln -s /opt/%{name}/r2modman %{buildroot}/usr/bin/r2modman

%files
%license LICENSE.electron.txt LICENSES.chromium.html
%doc
/opt/%{name}
/usr/bin/r2modman
/usr/share/applications/r2modman.desktop
/usr/share/metainfo/r2modman.metainfo.xml
/usr/share/icons/hicolor/256x256/apps/r2modman.png


%changelog
{{{ git_dir_changelog }}}