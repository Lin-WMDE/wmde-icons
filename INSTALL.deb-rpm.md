# Установка на deb/rpm-дистрибутивах без сборки из сырцов вручную

Шаблон: см. предыдущие компоненты (data-вариант `wmde-themes`). Автор собирает пакеты у себя локально, как сейчас `makepkg -si`.

Опорные платформы — Debian stable и Fedora: `.deb` собираем на Debian (встаёт и на Ubuntu/Mint),
`.rpm` — на Fedora (встаёт и на RHEL/openSUSE). Наоборот не гарантируется.

Пакет data-only: компиляции нет, только `just install` + nFPM. Тулчейн не нужен.

## Собрать

```sh
# зависимости сборки: just + nfpm
cargo install --locked nfpm  # или бинарник с github.com/goreleaser/nfpm/releases

just deb   # -> target/wmde-icons_*.deb
just rpm   # -> target/wmde-icons-*.rpm
```

Версия — `1.10.0.<commits>.g<sha>`, как `pkgver()` в `PKGBUILD`.

Лицензии разделены специально (см. PKGBUILD): WMDE-Extra несёт CC-BY-SA-арт,
поэтому живёт отдельным пакетом от GPL-темы, иначе пришлось бы всё сливать под GPL.

## Поставить

```sh
# Debian/Ubuntu/Mint
sudo apt install ./target/wmde-icons_*.deb

# Fedora/RHEL/openSUSE
sudo dnf install ./target/wmde-icons-*.rpm
```

Зависимость на `wmde-icons-base` НЕ заявляем специально (см. PKGBUILD): она идёт
в другую сторону, иначе цикл. Нижний слой подхватывается наследованием темы.
