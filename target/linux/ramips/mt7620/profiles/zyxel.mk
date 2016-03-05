#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# for routers with USB:
packages_KMOD_USB:=kmod-usb-core kmod-usb-rt305x-dwc_otg kmod-usb-ohci kmod-usb2 kmod-usb-storage kmod-ledtrig-usbdev
packages_LUCI_USB:=luci-proto-3g
packages_NET_USB:=kmod-usb-acm kmod-usb-net kmod-usb-net-rndis kmod-usb-serial kmod-usb-serial-option usb-modeswitch
packages_FS_USB:=kmod-fs-ext4 kmod-nls-cp1251
packages_USB:=$(packages_KMOD_USB) $(packages_LUCI_USB) $(packages_NET_USB) $(packages_FS_USB)

# for routers without USB:
# packages_FS_NET:=sshfs
packages_NOUSB:=$(packages_FS_NET)
packages_NOIPv6:=-kmod-ip6tables -kmod-ipv6 -odhcp6c -libip6tc

packages_NET_ETHERNET:=xl2tpd ppp-mod-pptp
packages_LUCI_GENERIC:=luci luci-i18n-russian
packages_GENERIC:=kmod-ledtrig-netdev kmod-nls-utf8
packages_IPv6:=luci-proto-ipv6

packages_8M:=ntfs-3g kmod-fs-vfat zram-swap
packages_4M:=-dropbear


define Profile/KEENETIC_LITE_II
	NAME:=ZyXEL Keenetic Lite II
	PACKAGES:=$(packages_GENERIC) $(packages_NET_ETHERNET) $(packages_NOUSB) $(packages_IPv6) $(packages_LUCI_GENERIC) $(packages_8M)
endef

define Profile/KEENETIC_LITE_II/Description
	Package set for ZyXEL Keenetic Lite II board
endef

$(eval $(call Profile,KEENETIC_LITE_II))


define Profile/KEENETIC_OMNI
	NAME:=ZyXEL Keenetic Omni
	PACKAGES:=$(packages_GENERIC) $(packages_NET_ETHERNET) $(packages_USB) $(packages_IPv6) $(packages_LUCI_GENERIC) $(packages_8M)
endef

define Profile/KEENETIC_OMNI/Description
	Package set for ZyXEL Keenetic Omni board
endef

$(eval $(call Profile,KEENETIC_OMNI))
