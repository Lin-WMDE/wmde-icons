WMDE Icons
==========

WMDE-specific icon art (fork of cosmic-icons). The `theme/` directory bundles merged
artwork from Cosmic, Pop, and Adwaita, so it needs no `cosmic-icon-theme` or
`pop-icon-theme`.

It installs as `WMDE-Extra`, which is the **bottom** layer and not a theme anything
points at. The user-facing `WMDE` and `WMDE-Dark` come from `wmde-icons-base` and inherit
this one:

    WMDE-Dark (light ink) -> WMDE (all of the art) -> WMDE-Extra -> hicolor
    WMDE      (dark ink)  -> WMDE-Extra -> hicolor

So what actually surfaces from here is the art the other set has no name for: our own app
icons, the distro logos, the `wmde-illustration-*` art `wmde-settings` draws, and roughly
111 `places` and 130 `categories` names.

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
