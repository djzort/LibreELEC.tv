# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8822BU"
PKG_VERSION="9c0fc247466901f90e04604844c8e581b837e771"
PKG_SHA256="e8dae9554176d8efcfc39c629fd2ceaf7df52e51e6aebe1c2d770236068f197f"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RinCat/RTL88x2BU-Linux-Driver"
PKG_URL="https://github.com/RinCat/RTL88x2BU-Linux-Driver/archive/$PKG_VERSION.tar.gz"


PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtek RTL8822BU Linux 4.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
