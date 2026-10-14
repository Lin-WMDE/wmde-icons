set export
rootdir := ''
prefix := '/usr'
# Чтобы shell() работал и на Windows с Git Bash; на Linux игнорируется
set windows-shell := ["C:\\Program Files\\Git\\bin\\sh.exe", "-cu"]
base-dir := absolute_path(clean(rootdir / prefix))
install-dir := base-dir / 'share'
icons := install-dir / 'icons' / 'WMDE-Extra'
export ICONS := icons

default:
    @just --list

# Install the merged artwork as WMDE-Extra, the bottom layer of the WMDE chain. The
# user-facing WMDE / WMDE-Dark themes live in wmde-icons-base and inherit this one.
# cp -a preserves alias symlinks; do NOT use `install` here (it dereferences symlinks).
install:
    mkdir -p {{icons}}
    cp -a ./theme/. {{icons}}/
    install -Dm0644 ./index.theme {{icons}}/index.theme

# Uninstalls everything (requires same arguments as given to install)
uninstall:
    rm -rf {{icons}}

# Show the current git commit
git-rev:
    @git rev-parse --short HEAD

# Версия пакета как pkgver() в PKGBUILD: 1.10.0.<commits>.g<sha>.
# Теги epoch-* дают только счётчик через git describe, fallback — rev-list.
wmde-version := shell('desc=$(git describe --long --tags --abbrev=7 2>/dev/null || true); if [ -n "$desc" ]; then printf "1.10.0.%s.g%s" "$(printf "%s" "$desc" | sed -E "s/.*-([0-9]+)-g[0-9a-f]+$/\\1/")" "$(git rev-parse --short=7 HEAD)"; else printf "1.10.0.%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"; fi')

# Раскладывает арт в target/staging (тот же набор, что PKGBUILD кладёт в $pkgdir).
# Сборки нет (data-only) — вендор-рецепты не нужны.
package-staging staging="target/staging":
    #!/usr/bin/env bash
    set -e
    rm -rf {{staging}}
    just rootdir="{{staging}}" install
    just package-doc "{{staging}}"

# doc для deb/rpm: копирайт + changelog.yaml (nFPM сам разложит changelog
# в changelog.Debian.gz для deb и в %changelog для rpm)
package-doc staging="target/staging":
    #!/usr/bin/env bash
    set -e
    mkdir -p "{{staging}}/usr/share/doc/wmde-icons"
    cp packaging/copyright "{{staging}}/usr/share/doc/wmde-icons/copyright"
    chmod 644 "{{staging}}/usr/share/doc/wmde-icons/copyright"
    printf -- '- semver: %s\n  date: %s\n  packager: WMDE <wmde@wmde.fun>\n  urgency: low\n  distribution: unstable\n  deb:\n    urgency: low\n    distributions:\n      - unstable\n  changes:\n    - note: Automated build via nFPM (see INSTALL.deb-rpm.md).\n' "{{wmde-version}}-1" "$(date -u +%Y-%m-%dT%H:%M:%SZ)" > target/changelog.yaml

# Собирает .deb через nFPM (нужен nfpm в PATH)
deb:
    #!/usr/bin/env bash
    set -e
    just package-staging
    export WMDE_VERSION="{{wmde-version}}"
    nfpm package --config packaging/nfpm.yaml --packager deb --target target/

# Собирает .rpm через nFPM (нужен nfpm в PATH)
rpm:
    #!/usr/bin/env bash
    set -e
    just package-staging
    export WMDE_VERSION="{{wmde-version}}"
    nfpm package --config packaging/nfpm.yaml --packager rpm --target target/
