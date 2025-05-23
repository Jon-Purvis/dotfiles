#!/usr/bin/env bash

cd "$HOME/dotfiles" || {
    echo "dotfiles directory not found at \$HOME/dotfiles"
    exit 1
}

DOTFILES_DIR="$PWD"

# detect OS
UNAME_OUT="$(uname | tr '[:upper:]' '[:lower:]')"
PLATFORM=""
case "$UNAME_OUT" in
    linux*)   PLATFORM="linux" ;;
    darwin*)  PLATFORM="mac" ;;
    *)        echo "Unsupported OS: $UNAME_OUT" && exit 1 ;;
esac
echo "platform: $PLATFORM"

COMMON_PACKAGES=(
    kitty
    zsh
    nvim
    scripts
    wallpapers
)

MAC_PACKAGES=(
    sketchybar
    jankyborders
    aerospace
)

LINUX_PACKAGES=(
    i3
    i3blocks
    picom
    dunst
    rofi
)

# merge packages based on platform
PACKAGES=("${COMMON_PACKAGES[@]}")
if [[ "$PLATFORM" == "mac" ]]; then
    PACKAGES+=("${MAC_PACKAGES[@]}")
elif [[ "$PLATFORM" == "linux" ]]; then
    PACKAGES+=("${LINUX_PACKAGES[@]}")
fi

echo "Packages to stow: ${PACKAGES[*]}"

# stow packages
for package in "${PACKAGES[@]}"; do
    echo "stowing $package..."
    stow -R -d "$DOTFILES_DIR" -t "$HOME" "$package"
done

# link kitty.platform.conf based on detected OS
KITTY_CONFIG_DIR="$HOME/.config/kitty"
SOURCE_CONF="$KITTY_CONFIG_DIR/kitty.$PLATFORM.conf"
TARGET_CONF="$KITTY_CONFIG_DIR/kitty.platform.conf"
mkdir -p "$KITTY_CONFIG_DIR"

if [[ -f "$SOURCE_CONF" ]]; then
    echo "Linking $SOURCE_CONF → $TARGET_CONF"
    ln -sf "$SOURCE_CONF" "$TARGET_CONF"
else
    echo "Warning: $SOURCE_CONF not found — platform-specific kitty config not linked"
fi
