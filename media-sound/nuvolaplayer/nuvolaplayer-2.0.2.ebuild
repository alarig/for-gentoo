# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=4

inherit vala waf-utils

DESCRIPTION="Cloud music integration for your Linux desktop"
HOMEPAGE="https://launchpad.net/nuvola-player"
SRC_URI="https://launchpad.net/nuvola-player/2.0.x/${PV}/+download/${P}.tar.gz"
LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND="
	x11-libs/gtk+:3
	dev-libs/libgee:0
	dev-libs/json-glib
	>=net-libs/webkit-gtk-1.2
	>=dev-libs/libunique-0.9
	>=net-libs/libsoup-2.34
"
DEPEND="${RDEPEND}
	$(vala_depend)
	dev-util/intltool
"

src_prepare() {
	vala_src_prepare --ignore-use
}

src_configure() {
	waf-utils_src_configure \
		--no-svg-optimization \
		--no-unity-quick-list
}