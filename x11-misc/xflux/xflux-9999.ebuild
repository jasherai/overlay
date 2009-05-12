# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Better lighting...for your computer"
HOMEPAGE="http://www.stereopsis.com/flux/"
SRC_URI="https://secure.herf.org/flux/xflux.tgz"
RESTRICT="primaryuri"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 -*"
# amd64 should run x86 binaries, although the libs might be in a different
# place. I just don't know.
IUSE=""

DEPEND=""
# This is an evil binary package
RDEPEND="=x11-libs/libXau-1.0.4
	=x11-libs/libXdmcp-1.0.2
	=x11-libs/libX11-1.1.5
	=x11-libs/libXext-1.0.4
	=x11-libs/libXxf86vm-1.0.2"

S="${WORKDIR}"

src_install() {
	dobin xflux
}
