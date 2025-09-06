%global uuid workspace-switcher-managerG-dH.github.com

Name:        gnome-shell-extension-workspace-switcher-manager
Version:     17
Release:     1%{?dist}
Summary:     A GNOME extension that offers all workspaces related options in one place

Group:       User Interface/Desktops
License:     GPLv3
URL:         https://github.com/G-dH/workspace-switcher-manager
Source0:     https://extensions.gnome.org/extension-data/%{uuid}.v%{version}.shell-extension.zip
BuildArch:   noarch

BuildRequires: glib2

Requires:    gnome-shell >= 3.12
%description
%{summary}.

%prep
%setup -c -n %{uuid}.v%{version}.shell-extension

%build
# Nothing to build

%install
mkdir -p %{buildroot}%{_datadir}/gnome-shell/extensions/%{uuid}
cp -r * %{buildroot}%{_datadir}/gnome-shell/extensions/%{uuid}/
glib-compile-schemas %{buildroot}%{_datadir}/gnome-shell/extensions/%{uuid}/schemas/

%files
%license LICENSE
%{_datadir}/gnome-shell/extensions/%{uuid}/

%changelog
{{{ git_dir_changelog }}}