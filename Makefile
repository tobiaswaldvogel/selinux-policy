# -*- Mode: makefile; indent-tabs-mode: t -*-
# SPDX-FileCopyrightText: © 2020 Dominick Grift <dominick.grift@defensec.nl>
# SPDX-License-Identifier: Unlicense

.PHONY: all clean minimal minwg minwgunbound policy check install

modules = $(shell find src -type f -name '*.cil' \
	! -name unboundhotplug.cil -printf '%p ')
modulesminimal = $(shell find src -type f -name '*.cil' \
	-regextype posix-egrep \
	! -regex 'src/(cgi|init)?script/.*\.cil' \
	! -name acme.cil ! -name autonoseclabelfs.cil \
	! -name blockmount.cil ! -name ip.cil ! -name luaexecfile.cil \
	! -name luci.cil ! -name opensslexecfile.cil \
	! -name px5gexecfile.cil ! -name rpcd.cil \
	! -name sftpserver.cil ! -name socatexecfile.cil \
	! -name uhttpd.cil ! -name unbound.cil \
	! -name unboundhotplug.cil ! -name wgetexecfile.cil \
	! -name wgetmiscfile.cil ! -name wireguard.cil -printf '%p ')
modulesminwg = $(shell find src -type f -name '*.cil' \
	-regextype posix-egrep \
	! -regex 'src/(cgi|init)?script/.*\.cil' \
	! -name acme.cil ! -name autonoseclabelfs.cil \
	! -name blockmount.cil ! -name luaexecfile.cil \
	! -name luci.cil ! -name opensslexecfile.cil \
	! -name px5gexecfile.cil ! -name rpcd.cil \
	! -name sftpserver.cil ! -name socatexecfile.cil \
	! -name uhttpd.cil ! -name unbound.cil \
	! -name unboundhotplug.cil ! -name wgetexecfile.cil \
	! -name wgetmiscfile.cil -printf '%p ')
modulesminwgunbound = $(shell find src -type f -name '*.cil' \
	-regextype posix-egrep \
	! -regex 'src/(cgi|init)?script/.*\.cil' \
	! -name acme.cil ! -name autonoseclabelfs.cil \
	! -name blockmount.cil ! -name dnsmasq.cil \
	! -name luaexecfile.cil ! -name luci.cil \
	! -name opensslexecfile.cil ! -name px5gexecfile.cil \
	! -name rpcd.cil ! -name sftpserver.cil \
	! -name socatexecfile.cil ! -name uhttpd.cil \
	! -name wgetexecfile.cil \
	! -name wgetmiscfile.cil -printf '%p ')
polvers = 31

all: clean policy check

clean: clean.$(polvers)
clean.%:
	rm -f policy.$* file_contexts

minimal: minimal.$(polvers)
minimal.%: $(modulesminimal)
	secilc --policyvers=$* $^

minwg: minwg.$(polvers)
minwg.%: $(modulesminwg)
	secilc --policyvers=$* $^

minwgunbound: minwgunbound.$(polvers)
minwgunbound.%: $(modulesminwgunbound)
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
