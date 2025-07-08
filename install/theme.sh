# Use dark mode for QT apps too (like VLC and kdenlive)
sudo pacman -S --noconfirm kvantum-qt5

# Prefer dark mode everything
sudo pacman -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Setup theme links
mkdir -p ~/.config/witchcraft/themes
for f in ~/.local/share/witchcraft/themes/*; do ln -s "$f" ~/.config/witchcraft/themes/; done

# Set initial theme
mkdir -p ~/.config/witchcraft/current
ln -snf ~/.config/witchcraft/themes/catppuccin ~/.config/witchcraft/current/theme

# Set initial wallpaper
ln -snf ~/.local/share/witchcraft/backgrounds/1.png ~/.config/witchcraft/current/background
wal -i ~/.config/witchcraft/current/background -t -s

# Copy cursors
cp -r ~/.local/share/witchcraft/cursors ~/.local/share/icons/

# Set specific app links for current theme
# mkdir -p ~/.config/btop/themes
# ln -snf ~/.config/witchcraft/current/theme/btop.theme ~/.config/btop/themes/current.theme

# mkdir -p ~/.config/bat/themes
# ln -snf ~/.config/witchcraft/current/theme/bat.tmTheme ~/.config/bat/themes/current.tmTheme
# bat cache --build

# Set import for wofi style
WOFI_STYLE_FILE="$HOME/.config/wofi/style.css"
IMPORT_LINE="@import \"$HOME/.cache/wal/colors-waybar.css\";"

if [ ! -f "$WOFI_STYLE_FILE" ]; then
    echo "Error: Wofi style file not found at $WOFI_STYLE_FILE."
fi

if grep -qF -- "$IMPORT_LINE" "$WOFI_STYLE_FILE"; then
    echo "Import line already exists in $WOFI_STYLE_FILE. No action needed."
else
    echo "$IMPORT_LINE" | cat - "$WOFI_STYLE_FILE" > "${WOFI_STYLE_FILE}.tmp" && \
    mv "${WOFI_STYLE_FILE}.tmp" "$WOFI_STYLE_FILE"
    echo "Import line added to the beginning of $WOFI_STYLE_FILE."
fi

. "${HOME}/.cache/wal/colors.sh"

MAKO_CONFIG="${HOME}/.config/mako/config"

# Associative array, color name -> color code.
declare -A colors
colors=(
    ["background-color"]="${background}89"
    ["text-color"]="$foreground"
    ["border-color"]="$color13"
)

for color_name in "${!colors[@]}"; do
  # replace first occurance of each color in config file
  sed -i "0,/^$color_name.*/{s//$color_name=${colors[$color_name]}/}" $MAKO_CONFIG
done

makoctl reload