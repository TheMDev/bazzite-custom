#!/bin/bash

set -eoux pipefail

echo "::group::Installing Kernel Debug Packages"
trap 'echo "::endgroup::"' EXIT

# Install Kernel Debug Packages
dnf5 install -y \
    --enablerepo="fedora-debuginfo" \
    --enablerepo="updates-debuginfo" \
    crash \
    kdump-utils \
    kernel-debuginfo \
    kexec-tools \
    makedumpfile
