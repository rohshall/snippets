#!/usr/bin/env bash

cargo install --frozen --offline --root=usr --path wezterm
cargo install --frozen --offline --root=usr --path wezterm-gui
cargo install --frozen --offline --root=usr --path wezterm-mux-server
cargo install --frozen --offline --root=usr --path strip-ansi-escapes

doas cp usr/bin/* /usr/bin/
doas cp assets/wezterm.desktop /usr/share/applications 
doas cp assets/wezterm.appdata.xml /usr/share/metainfo 
# doas cp LICENSE.md /usr/share/licences/wezterm 
doas cp assets/shell-integration/wezterm.sh /etc/profile.d 
doas cp assets/icon/terminal.png /usr/share/pixmaps/wezterm.png 
doas cp assets/icon/wezterm-icon.svg /usr/share/pixmaps/wezterm.svg 
doas cp assets/icon/terminal.png /usr/share/icons/hicolor/128x128/apps/wezterm.png 
doas cp assets/icon/wezterm-icon.svg /usr/share/icons/hicolor/scalable/apps/wezterm.svg 
doas cp terminfo/w/wezterm /usr/share/terminfo/w/wezterm 
rm usr/.crates*
