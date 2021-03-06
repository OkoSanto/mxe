# This file is part of MXE.
# See index.html for further information.

PKG             := xapian-core
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.2.21
$(PKG)_CHECKSUM := 63f48758fbd13fa8456dd4cf9bf3ec35a096e4290f14a51ac7df23f78c162d3f
$(PKG)_SUBDIR   := xapian-core-$($(PKG)_VERSION)
$(PKG)_FILE     := xapian-core-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://oligarchy.co.uk/xapian/$($(PKG)_VERSION)/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc zlib

define $(PKG)_UPDATE
    $(WGET) -q -O- http://xapian.org/download | \
    $(SED) -n 's,.*<a HREF="http://oligarchy.co.uk/xapian/\([^/]*\)/xapian-core[^"]*">.*,\1,p' | \
    head -1
endef

define $(PKG)_BUILD
    cd '$(1)' && ./configure \
        $(MXE_CONFIGURE_OPTS)
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef
