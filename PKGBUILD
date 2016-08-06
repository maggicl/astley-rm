# Maintainer: Claudio Maggioni <youremail@domain.com>
pkgname=astley-rm
pkgver=1
pkgrel=1
pkgdesc="Prevent 'rm -rf' playing Never Gonna Give You Up"
arch=('any')
url="https://praticamentetilde.github.io/linux/2016/07/28/how-to-rickroll-people-launching-rm-rf-on-your-system.html"
license=('custom:unlicense')
makedepends=('git' 'youtube-dl')

_branch=master

source=("$pkgname-$_branch.zip::https://github.com/praticamentetilde/$pkgname/archive/$_branch.zip")
sha512sums=(SKIP)

package() {
  cd "$srcdir"
  echo "Placing /usr/bin/astley-rm script..."
  install -D -m755 astley-rm.sh "$pkgdir"/usr/bin/astley-rm
  echo "Placing /usr/bin/astley-rm-config script..."
  install -D -m755 astley-rm-config.sh "$pkgdir"/usr/bin/astley-rm-config
  echo "Installing license..."
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  echo "Done."
}
