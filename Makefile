# -*- Mode: makefile; indent-tabs-mode: t -*-
# SPDX-FileCopyrightText: © 2021 Dominick Grift <dominick.grift@defensec.nl>
# SPDX-License-Identifier: Unlicense

.PHONY: all clean noluci mintesttgt policy check install

# default target, all modules: unboundhotplug and rcunbound are mutually exclusive
modules = $(shell find src -type f -name '*.cil' \
	! -name unboundhotplug.cil -printf '%p ')

# no luci: this target is more robust but does it not cover luci and does not target initscripts
modulesnoluci = $(shell find src -type f -name '*.cil' \
	-regextype posix-egrep \
	! -regex 'src/(cgi|init)?script/.*\.cil' \
	! -name luci.cil ! -name rpcd.cil ! -name uhttpd.cil \
	-printf '%p ')

# my own customised target, tailored to my personal requirements
modulesmintesttgt = $(shell find src -type f -name '*.cil' \
	-regextype posix-egrep \
	! -regex 'src/(cgi|init)?script/.*\.cil' \
	! -name autonoseclabelfs.cil ! -name blockd.cil \
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

noluci: noluci.$(polvers)
noluci.%: $(modulesnoluci)
	secilc -vvv --policyvers=$* $^

mintesttgt: mintesttgt.$(polvers)
mintesttgt.%: $(modulesmintesttgt)
	secilc -vvv --policyvers=$* $^

policy: policy.$(polvers)
policy.%: $(modules)
	secilc -vvv --policyvers=$* $^

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
