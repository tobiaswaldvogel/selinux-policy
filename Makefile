# -*- Mode: makefile; indent-tabs-mode: t -*-
# SPDX-FileCopyrightText: © 2020 Dominick Grift <dominick.grift@defensec.nl>
# SPDX-License-Identifier: Unlicense

.PHONY: all clean min mintesttgt policy check install

# Default selection of modules, unboundhotplug can be excluded if rcunbound is included (theyre mutually exclusive)
modules = $(shell find src -type f -name '*.cil' \
	! -name unboundhotplug.cil -printf '%p ')

# Selection of least required modules (no LuCI: optimized for base snapshot image)
modulesmin = $(shell find src -type f -name '*.cil' \
	-regextype posix-egrep \
	! -regex 'src/(cgi|init)?script/.*\.cil' \
	! -name acme.cil ! -name blockmount.cil ! -name chrony.cil \
	! -name ip.cil ! -name luaexecfile.cil ! -name luci.cil \
	! -name ngircd.cil \
	! -name opensslexecfile.cil ! -name px5gexecfile.cil \
	! -name rpcd.cil ! -name sftpserver.cil \
	! -name socatexecfile.cil ! -name sqm.cil \
	! -name tinyproxy.cil ! -name uhttpd.cil \
	! -name unbound.cil ! -name unboundcontrol.cil \
	! -name unboundhotplug.cil ! -name wgetexecfile.cil \
	! -name wgetmiscfile.cil ! -name wireguard.cil -printf '%p ')

# selection of modules that i use on my own router
modulesmintesttgt = $(shell find src -type f -name '*.cil' \
	-regextype posix-egrep \
	! -regex 'src/(cgi|init)?script/.*\.cil' \
	! -name autonoseclabelfs.cil \
	! -name blockmount.cil ! -name clocknodedev.cil \
	! -name cpunodedev.cil ! -name dmctlnodedev.cil \
	! -name dmstordev.cil ! -name dnsmasq.cil \
	! -name drinodedev.cil ! -name framebufnodedev.cil \
	! -name fusenoseclabelfs.cil ! -name fusestordev.cil \
	! -name fusefssysfile.cil ! -name hdstordev.cil \
	! -name iso9660noseclabelfs.cil ! -name luaexecfile.cil \
	! -name luci.cil ! -name mmcstordev.cil \
	! -name nvmestordev.cil ! -name nvramnodedev.cil \
	! -name px5gexecfile.cil \
	! -name rpcd.cil ! -name sftpserver.cil \
	! -name srstordev.cil \
	! -name uhttpd.cil ! -name vdstordev.cil \
	! -name vmcinodedev.cil -printf '%p ')

polvers = 31

all: clean policy check

clean: clean.$(polvers)
clean.%:
	rm -f policy.$* file_contexts

min: min.$(polvers)
min.%: $(modulesmin)
	secilc --policyvers=$* $^

mintesttgt: mintesttgt.$(polvers)
mintesttgt.%: $(modulesmintesttgt)
	secilc --policyvers=$* $^

policy: policy.$(polvers)
policy.%: $(modules)
	secilc --policyvers=$* $^

check: check.$(polvers)
check.%:
	setfiles -c policy.$* file_contexts

install: install.$(polvers)
install.%:
	install -d $(DESTDIR)/etc/selinux/selinux-policy/contexts/files/
	install -d $(DESTDIR)/etc/selinux/selinux-policy/policy/
	install -m 644 customizable_types $(DESTDIR)/etc/selinux/selinux-policy/contexts/
	install -m 644 file_contexts $(DESTDIR)/etc/selinux/selinux-policy/contexts/files/
	install -m 644 file_contexts.subs_dist $(DESTDIR)/etc/selinux/selinux-policy/contexts/files/
	install -m 600 policy.$* $(DESTDIR)/etc/selinux/selinux-policy/policy/
