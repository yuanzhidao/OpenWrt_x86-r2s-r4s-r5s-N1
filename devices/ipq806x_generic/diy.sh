#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))

svn co https://github.com/coolsnowwolf/lede/trunk/package/qca package/qca

sed -i 's/DEFAULT_PACKAGES +=/DEFAULT_PACKAGES += kmod-qca-nss-drv kmod-qca-nss-ecm-standard kmod-qca-nss-gmac kmod-qca-nss-drv-pppoe kmod-qca-mcs/' target/linux/ipq806x/Makefile