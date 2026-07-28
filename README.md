WMDE Icons
==========

Icon theme for the WMDE desktop (fork of cosmic-icons). The `theme/` directory bundles
merged artwork from Cosmic, Pop, and Adwaita, so it needs no `cosmic-icon-theme` or
`pop-icon-theme`.

Two themes are installed: `WMDE` and `WMDE-Dark`. They carry the same art and differ
only in what they fall back to - `wmde-icons-base` ships that fallback in a dark-ink and
a light-ink variant, and the settings daemon points Qt at whichever matches the current
mode. The fallback exists because Qt looks up plain (non `-symbolic`) icon names and
most of the action art here is `-symbolic` only.

## Copying or Reusing

This project has mixed licencing. You are free to copy, redistribute and/or modify aspects of this work under the terms of each licence accordingly (unless otherwise specified).

The icon assets (any and all source `.svg` files or rendered `.png` files) are licenced under Creative Commons Attribution-ShareAlike: the Cosmic and Pop artwork under [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/), and the Adwaita artwork under [CC-BY-SA-3.0](https://creativecommons.org/licenses/by-sa/3.0/) or LGPL-3.0.

Included scripts are free software licenced under the terms of the [GNU General Public License, version 3](https://www.gnu.org/licenses/gpl-3.0.txt).

When reusing this work please include proper attribution for each bundled source:

> "[Cosmic Icons](https://github.com/pop-os/cosmic-icons)" by [System76](https://system76.com/) - [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/)
>
> "[Pop Icon Theme](https://github.com/pop-os/icon-theme)" by [System76](https://system76.com/) - [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/)
>
> "[Adwaita Icon Theme](https://gitlab.gnome.org/GNOME/adwaita-icon-theme)" by the [GNOME Project](https://www.gnome.org/) - [CC-BY-SA-3.0](https://creativecommons.org/licenses/by-sa/3.0/) or LGPL-3.0
