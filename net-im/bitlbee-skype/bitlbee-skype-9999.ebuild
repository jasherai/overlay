# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-im/bitlbee/bitlbee-1.2.3-r1.ebuild,v 1.4 2008/11/01 17:21:32 nixnut Exp $

EAPI="2"
inherit eutils toolchain-funcs confutils
[ "${PV}" == "9999" ] && inherit git autotools

DESCRIPTION="bitlbee plugin for skype"
HOMEPAGE="http://vmiklos.hu/project/bitlbee-skype/"
if [ "$PV" != "9999" ]; then
     	SRC_URI="http://vmiklos.hu/project/bitlbee-skype/${P}.tar.gz"
else
        SRC_URI=""
        EGIT_BRANCH="master"
	EGIT_REPACK=true
        EGIT_REPO_URI="git://vmiklos.hu/bitlbee-skype"
fi
				

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ia64 x86"
IUSE="debug"
RESTRICT="primaryuri"

DEPEND=">=sys-devel/automake-1.7.2
	>=net-im/skype-1.4.0.99
	>=net-im/bitlbee-1.2.3
	>=dev-lang/python-2.5
	>=dev-python/skype4py-0.9.28.7
	dev-python/pygobject
	dev-python/python-gnutls"

src_unpack() {
        if [ "${PV}" != "9999" ]; then
		default
        else
                git_src_unpack
        fi    
}

src_prepare() {
        if [ "${PV}" != "9999" ]; then
		default
        else	
	    	eautoconf
#                emake autogen
        fi    
}

src_configure() {
    econf --prefix=/usr
}

src_compile() {
    emake || die "emake of ${P} failed"
}

src_install() {
    emake DESTDIR=${D} install || die "emake install failed"
}

pkg_postinstall() {
    einfo "Please refer to the project homepage for info"
    einfo "http://vmiklos.hu/project/bitlbee-skype/"
    einfo
    einfo
    einfo "Basic steps are to:"
    einfo "   configure /etc/skyped/skyped.{conf,cnf}'
    einfo "   setup ssl keys"
    einfo "      # cd /etc/skyped/ && openssl req -new -x509 -days 365 -nodes -config skyped.cnf -out skyped.cert.pem \ "
    einfo "        -keyout skyped.key.pem"
    einfo "   start skyped"
    einfo "   	   skyped # homepage documentation offers further suggestions for starting through vnc on a server"
    einfo "   configure your skype account in bitlbee"
}
