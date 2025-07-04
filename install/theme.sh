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
source ~/.local/share/witchcraft/themes/catppuccin/backgrounds.sh
ln -snf ~/.config/witchcraft/backgrounds/catppuccin ~/.config/witchcraft/current/backgrounds
ln -snf ~/.config/witchcraft/current/backgrounds/1-Pawel-Czerwinski-Abstract-Purple-Blue.jpg ~/.config/witchcraft/current/background

# Set specific app links for current theme
ln -snf ~/.config/witchcraft/current/theme/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -snf ~/.config/witchcraft/current/theme/wofi.css ~/.config/wofi/style.css
ln -snf ~/.config/witchcraft/current/theme/neovim.lua ~/.config/nvim/lua/plugins/theme.lua
mkdir -p ~/.config/btop/themes
ln -snf ~/.config/witchcraft/current/theme/btop.theme ~/.config/btop/themes/current.theme
mkdir -p ~/.config/mako
ln -snf ~/.config/witchcraft/current/theme/mako.ini ~/.config/mako/config
mkdir -p ~/.config/bat/themes
ln -snf ~/.config/witchcraft/current/theme/bat.tmTheme ~/.config/bat/themes/current.tmTheme
bat cache --build