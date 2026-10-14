# Maintainer: WMDE <https://wmde.fun>
# Contributor: System76 <info@system76.com> (original cosmic-icons)
#
# Builds our fork Lin-WMDE/wmde-icons (branch wmde). Data-only: installs the merged
# artwork (WMDE-own + Cosmic + Pop + Adwaita) as /usr/share/icons/WMDE-Extra, so it needs
# NO cosmic-icon-theme / pop-icon-theme.
#
# WMDE-Extra is the BOTTOM layer, not the theme anything points at: wmde-icons-base owns
# the user-facing WMDE / WMDE-Dark and inherits this. What actually surfaces from here is
# the art that set has no name for - our own app icons, the distro logos, the
# wmde-illustration-* art, ~111 places and ~130 categories names.
#
# Deliberately does NOT depend on wmde-icons-base: the dependency runs the other way, and
# declaring it here too would be a cycle.
# Installs alongside cosmic-icons (distinct theme dir), so NO conflicts/replaces cosmic-icons.
pkgname=wmde-icons
pkgver=1.0.0
pkgrel=2
pkgdesc="WMDE-specific icon art (fork of cosmic-icons) - installs /usr/share/icons/WMDE-Extra"
arch=('any')
url="https://wmde.fun"
# icon assets are CC-BY-SA-4.0 (Cosmic/Pop) and CC-BY-SA-3.0 (bundled Adwaita);
# the install scripts are GPL-3.0 (see README/COPYING for per-source attribution)
license=('CC-BY-SA-4.0' 'CC-BY-SA-3.0' 'GPL-3.0-or-later')
depends=('hicolor-icon-theme')
makedepends=('just' 'git')
source=("$pkgname::git+https://github.com/Lin-WMDE/wmde-icons.git#branch=wmde")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # WMDE version: <COSMIC major.minor>.<WMDE release>.<commits since the nearest tag>.g<short>.
  local desc
  desc=$(git describe --long --tags --abbrev=7 2>/dev/null || true)
  if [ -n "$desc" ]; then
    printf '1.10.1.%s.g%s' "$(printf '%s' "$desc" | sed -E 's/.*-([0-9]+)-g[0-9a-f]+$/\1/')" "$(git rev-parse --short=7 HEAD)"
  else
    printf '1.10.1.%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

package() {
  cd "$srcdir/$pkgname"
  # installs the theme into /usr/share/icons/WMDE (dir set in justfile)
  just rootdir="$pkgdir" prefix=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
