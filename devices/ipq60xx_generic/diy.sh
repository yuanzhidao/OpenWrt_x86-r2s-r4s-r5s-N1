#!/bin/bash
shopt -s extglob

svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/ipq60xx target/linux/ipq60xx

svn co https://github.com/coolsnowwolf/lede/trunk/package/qca package/qca

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += kmod-qca-nss-dp kmod-qca-nss-drv-64 kmod-qca-nss-drv-pppoe-64 nss-firmware-ipq6018 qca-nss-ecm-64/' target/linux/ipq60xx/Makefile
