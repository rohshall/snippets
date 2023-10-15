#!/usr/bin/env bash
cargo fetch --locked
cargo build --release --frozen --manifest-path wezterm/Cargo.toml
cargo build --release --frozen --manifest-path wezterm-gui/Cargo.toml
cargo build --release --frozen --manifest-path wezterm-mux-server/Cargo.toml
cargo build --release --frozen --manifest-path strip-ansi-escapes/Cargo.toml

tic -x -o terminfo termwiz/data/wezterm.terminfo
cargo test --frozen
