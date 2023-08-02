#!/bin/bash
shopt -s extglob

svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ipq60xx target/linux/ipq60xx

git clone https://github.com/robimarko/nss-packages package/nss-packages
svn co https://github.com/coolsnowwolf/lede/trunk/package/qca package/nss-packages/qca
rm -rf package/nss-packages/qca/qca-ssdk package/nss-packages/qca/qca-nss-dp package/nss-packages/qca/nss/qca-nss-dp package/nss-packages/qca/nss/qca-*-64

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += kmod-qca-nss-dp kmod-qca-nss-drv-64 kmod-qca-nss-drv-pppoe-64 nss-firmware-ipq6018 qca-nss-ecm-64/' target/linux/ipq60xx/Makefile
