# -*-makefile-*-
#
# Copyright (C) 2018 by Robert Schwebel <r.schwebel@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_OPEN62541) += open62541

#
# Paths and names
#
OPEN62541_VERSION	:= 0.3-rc2
OPEN62541_MD5		:= 75a19560b399a5a40e7d981b14bf82ef
OPEN62541		:= open62541-$(OPEN62541_VERSION)
OPEN62541_SUFFIX	:= tar.gz
OPEN62541_URL		:= https://github.com/open62541/open62541/archive/$(OPEN62541_VERSION).$(OPEN62541_SUFFIX)
OPEN62541_SOURCE	:= $(SRCDIR)/$(OPEN62541).$(OPEN62541_SUFFIX)
OPEN62541_DIR		:= $(BUILDDIR)/$(OPEN62541)
OPEN62541_LICENSE	:= MPL-2.0

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

OPEN62541_CONF_TOOL	:= cmake
OPEN62541_CONF_OPT	:= \
	$(CROSS_CMAKE_USR) \
	-DUA_BUILD_EXAMPLES=ON

# FIXME: add lots of additional configure switches

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/open62541.targetinstall:
	@$(call targetinfo)

	@$(call install_init, open62541)
	@$(call install_fixup, open62541,PRIORITY,optional)
	@$(call install_fixup, open62541,SECTION,base)
	@$(call install_fixup, open62541,AUTHOR,"Robert Schwebel <r.schwebel@pengutronix.de>")
	@$(call install_fixup, open62541,DESCRIPTION,missing)

	@$(call install_copy, open62541, 0, 0, 0755, \
		$(BUILDDIR)/$(OPEN62541)-build/bin/examples/client, \
		/usr/bin/open62541-client)

	@$(call install_finish, open62541)

	@$(call touch)

# vim: syntax=make
