# Maintainer: WMDE <https://wmde.fun>
# Contributor: System76 <info@system76.com> (original cosmic-icons)
#
# Builds our fork Lin-WMDE/wmde-icons (branch wmde). Data-only icon theme:
# installs /usr/share/icons/WMDE (index.theme Name=WMDE, Inherits=hicolor).
# SELF-CONTAINED: ships/theme/ = merged artwork (WMDE-own + Cosmic + Pop + Adwaita),
# so it needs NO cosmic-icon-theme / pop-icon-theme; it inherits only hicolor.
# Installs alongside cosmic-icons (distinct theme dir), so NO conflicts/replaces cosmic-icons.
pkgname=wmde-icons
pkgver=1.0.0
pkgrel=1
pkgdesc="WMDE icon theme (self-contained fork of cosmic-icons) - installs /usr/share/icons/WMDE"
arch=('any')
url="https://wmde.fun"
# icon assets are CC-BY-SA-4.0; the install scripts are GPL-3.0 (see README/LICENSE)
license=('CC-BY-SA-4.0' 'GPL-3.0-or-later')
depends=('hicolor-icon-theme')
makedepends=('just' 'git')
source=("$pkgname::git+https://github.com/Lin-WMDE/wmde-icons.git#branch=wmde")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^epoch-//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf '1.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  # installs the theme into /usr/share/icons/WMDE (dir set in justfile)
  just rootdir="$pkgdir" prefix=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
