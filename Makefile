# -*- Mode: makefile; indent-tabs-mode: t -*-
# SPDX-FileCopyrightText: © 2020 Dominick Grift <dominick.grift@defensec.nl>
# SPDX-License-Identifier: Unlicense

.PHONY: all clean policy check install

modules = $(shell find src -name '*.cil' -type f -printf '%p ')
polvers = 32

all: clean policy check

clean: clean.$(polvers)
clean.%:
	rm -f policy.$* file_contexts

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
	install -m 644 file_contexts $(DESTDIR)/etc/selinux/selinux-policy/contexts/files/
	install -m 644 file_contexts.subs_dist $(DESTDIR)/etc/selinux/selinux-policy/contexts/files/
	install -m 600 policy.$* $(DESTDIR)/etc/selinux/selinux-policy/policy/
