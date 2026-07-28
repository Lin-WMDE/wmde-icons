set export
rootdir := ''
prefix := '/usr'
base-dir := absolute_path(clean(rootdir / prefix))
install-dir := base-dir / 'share'
icons := install-dir / 'icons' / 'WMDE'
icons-dark := install-dir / 'icons' / 'WMDE-Dark'
export ICONS := icons

default:
    @just --list

# Install the self-contained theme (merged artwork) + index.theme, then WMDE-Dark beside
# it: the same art, symlinked, with a light-ink fallback instead of a dark-ink one.
# Symlinks rather than Inherits=WMDE on purpose - see the comment in index.theme.
# WMDE-Dark is Hidden=true: the settings daemon switches to it by mode, it is not a theme
# to pick from the list next to WMDE.
# cp -a preserves alias symlinks; do NOT use `install` here (it dereferences symlinks).
install:
    mkdir -p {{icons}}
    cp -a ./theme/. {{icons}}/
    install -Dm0644 ./index.theme {{icons}}/index.theme
    mkdir -p {{icons-dark}}
    sed -e 's/^Name=.*/Name=WMDE-Dark/' -e 's/^Comment=.*/Comment=WMDE Icons (dark)/' -e 's/^Inherits=.*/Hidden=true\nInherits=WMDE-Base-Dark,hicolor/' ./index.theme > {{icons-dark}}/index.theme
    for d in ./theme/*/; do n=$(basename "$d"); ln -sfn "../WMDE/$n" "{{icons-dark}}/$n"; done

# Uninstalls everything (requires same arguments as given to install)
uninstall:
    rm -rf {{icons}} {{icons-dark}}

# Show the current git commit
git-rev:
    @git rev-parse --short HEAD
