%global uuid advanced-alt-tabG-dH.github.com

Name:        gnome-shell-extension-advanced-alttab-window-switcher
Version:     63
Release:     1%{?dist}
Summary:     A GNOME extension that enhances built-in switchers

Group:       User Interface/Desktops
License:     GPLv3
URL:         https://github.com/G-dH/advanced-alttab-window-switcher
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