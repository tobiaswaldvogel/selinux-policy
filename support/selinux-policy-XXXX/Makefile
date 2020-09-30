# -*- Mode: makefile; indent-tabs-mode: t -*-
# SPDX-FileCopyrightText: © 2020 Dominick Grift <dominick.grift@defensec.nl>
# SPDX-License-Identifier: Unlicense

include $(TOPDIR)/rules.mk

PKG_NAME:=selinux-policy-XXXX
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://XXXX/selinux-policy-XXXX.git
PKG_SOURCE_DATE:=XXXX-XX-XX
PKG_SOURCE_VERSION:=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
PKG_MIRROR_HASH:=skip
PKG_BUILD_DEPENDS:=secilc/host

PKG_LICENSE:=Unlicense
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=XXXX <XXXX@XXXX>
PKG_CPE_ID:=cpe:/a:XXXX:selinux-policy-XXXX

include $(INCLUDE_DIR)/package.mk

define Package/selinux-policy-XXXX
	SECTION:=system
	CATEGORY:=Base system
	TITLE:=XXXX SELinux policy for OpenWRT
	URL:=https://XXXX/
	PKGARCH:=all
endef

define Package/selinux-policy-XXXX/description
	XXXX SELinux security policy designed specifically for OpenWRT
	and written in Common Intermediate Language.
endef

define Build/Compile
	$(call Build/Compile/Default,policy)
endef

define Package/selinux-policy-XXXX/conffiles
/etc/selinux/config
endef

define Package/selinux-policy-XXXX/install
	$(INSTALL_DIR) $(1)/etc/selinux/$(PKG_NAME)/contexts/files/
	$(INSTALL_DIR) $(1)/etc/selinux/$(PKG_NAME)/policy/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/file_contexts.subs_dist $(1)/etc/selinux/$(PKG_NAME)/contexts/files/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/file_contexts $(1)/etc/selinux/$(PKG_NAME)/contexts/files/
	$(INSTALL_CONF) $(PKG_BUILD_DIR)/policy.* $(1)/etc/selinux/$(PKG_NAME)/policy/
	$(INSTALL_DATA) ./files/selinux-config $(1)/etc/selinux/config
endef

$(eval $(call BuildPackage,selinux-policy-XXXX))
