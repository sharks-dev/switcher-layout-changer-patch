Name:       switcher-layout-changer-patch

BuildArch: noarch

Summary:    Switcher Layout Changer
Version:    0.0.1
Release:    1
Group:      Qt/Qt
License:    WTFPL
Source0:    %{name}-%{version}.tar.bz2
Requires:   patchmanager

%description
Change the switcher grid layout for easier reachability - allows pinning windows to top left (default), bottom left, top right, or bottom right.

%prep
%setup -q -n %{name}-%{version}

%build

%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/usr/share/patchmanager/patches/switcher_layout_changer
cp -r patch/* %{buildroot}/usr/share/patchmanager/patches/switcher_layout_changer

%pre
if [ -d /var/lib/patchmanager/ausmt/patches/switcher_layout_changer ]; then
/usr/sbin/patchmanager -u switcher_layout_changer || true
fi

%preun
if [ -d /var/lib/patchmanager/ausmt/patches/switcher_layout_changer ]; then
/usr/sbin/patchmanager -u switcher_layout_changer || true
fi

%files
%defattr(-,root,root,-)
%{_datadir}/patchmanager/patches/switcher_layout_changer 
