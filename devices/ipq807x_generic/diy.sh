#!/bin/bash
shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

git clone https://github.com/robimarko/nss-packages package/nss-packages
svn co https://github.com/coolsnowwolf/lede/trunk/package/qca package/nss-packages/qca
mv -f package/qca/nss/* package/qca/
rm -rf package/nss-packages/qca/qca-ssdk package/nss-packages/qca/qca-nss-dp package/nss-packages/qca/qca-*-64 package/nss-packages/qca/nss

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += kmod-qca-nss-dp kmod-qca-nss-drv kmod-qca-nss-drv-pppoe kmod-qca-nss-ecm kmod-qca-nss-drv-bridge-mgr kmod-qca-nss-drv-vlan-mgr nss-firmware-ipq8074/' target/linux/ipq807x/Makefile

sh -c "curl -sfL https://github.com/robimarko/openwrt/commit/23fa931934151f72c1655ffa62ff1a979575f07e.patch | patch -d './' -p1 --forward"

sed -i '/rm -rf $(KDIR)\/tmp/d' include/image.mk

rm -rf feeds/kiddin9/{rtl8821cu,rtl88x2bu} package/kernel/mt76 devices/common/patches/mt7922.patch
