# Use dark mode for QT apps too (like VLC and kdenlive)
sudo pacman -S --noconfirm kvantum-qt5

# Prefer dark mode everything
sudo pacman -S --noconfirm gnome-themes-extra # Adds Adwaita-dark theme
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"

# Set initial wallpaper
mkdir -p ~/.config/witchcraft/current
ln -snf ~/.local/share/witchcraft/backgrounds/1.png ~/.config/witchcraft/current/background
wal -i ~/.config/witchcraft/current/background -t -s

# Copy cursors
cp -r ~/.local/share/witchcraft/cursors ~/.local/share/icons/

# Copy colors for mako
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