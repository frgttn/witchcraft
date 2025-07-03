echo ":: Installing Flatpak..."
yay -S --noconfirm --needed flatpak

echo ":: Adding a Flathub Repository..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak_packages=(
  com.spotify.Client
  us.zoom.Zoom
  md.obsidian.Obsidian
  com.obsproject.Studio
  org.onlyoffice.desktopeditors
  com.github.tchx84.Flatseal
  org.telegram.desktop
  com.valvesoftware.Steam
  com.discordapp.Discord
  app.zen_browser.zen
  com.bitwarden.desktop
)

echo ":: Installing Flatpak Application: ${flatpak_packages[*]}..."
flatpak install -y --noninteractive flathub "${flatpak_packages[@]}"

echo ":: Flatpak apps installation complete."

# Copy over Witchcraft applications
source ~/.local/share/witchcraft/bin/witchcraft-sync-applications

# Make swaybg-next an executable.
chmod +x $HOME/.local/share/witchcraft/bin/* 2>/dev/null
