#!/usr/bin/env bash

cargo install --frozen --offline --root=usr --path wezterm
cargo install --frozen --offline --root=usr --path wezterm-gui
cargo install --frozen --offline --root=usr --path wezterm-mux-server
cargo install --frozen --offline --root=usr --path strip-ansi-escapes

sudo cp usr/bin/* /usr/bin/
sudo cp assets/wezterm.desktop /usr/share/applications 
sudo cp assets/wezterm.appdata.xml /usr/share/metainfo 
# sudo cp LICENSE.md /usr/share/licences/wezterm 
sudo cp assets/shell-integration/wezterm.sh /etc/profile.d 
sudo cp assets/icon/terminal.png /usr/share/pixmaps/wezterm.png 
sudo cp assets/icon/wezterm-icon.svg /usr/share/pixmaps/wezterm.svg 
sudo cp assets/icon/terminal.png /usr/share/icons/hicolor/128x128/apps/wezterm.png 
sudo cp assets/icon/wezterm-icon.svg /usr/share/icons/hicolor/scalable/apps/wezterm.svg 
sudo cp terminfo/w/wezterm /usr/share/terminfo/w/wezterm 
rm usr/.crates*
