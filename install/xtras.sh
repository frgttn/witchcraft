paru -S --noconfirm --needed \
  flatpak discord telegram-desktop spotify bitwarden zoom \
  obsidian-bin onlyoffice-bin obs-studio kdenlive \
  zen-browser-bin localsend-bin

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak_packages=(
  com.github.tchx84.Flatseal
  com.valvesoftware.Steam
)

flatpak install -y --noninteractive flathub "${flatpak_packages[@]}"

# Copy over Witchcraft applications
source ~/.local/share/witchcraft/bin/witchcraft-sync-applications || true

# Make swaybg-next an executable.
chmod +x $HOME/.local/share/witchcraft/bin/* 2>/dev/null
