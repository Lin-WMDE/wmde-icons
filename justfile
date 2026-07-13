set export
rootdir := ''
prefix := '/usr'
base-dir := absolute_path(clean(rootdir / prefix))
install-dir := base-dir / 'share'
icons := install-dir / 'icons' / 'WMDE'
export ICONS := icons

default:
    @just --list

# Install the self-contained theme (merged artwork) + index.theme.
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
