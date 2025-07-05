# Copy over Witchcraft configs
cp -R ~/.local/share/witchcraft/config/* ~/.config/

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Use default bashrc from Witchcraft
echo "source ~/.local/share/witchcraft/default/bash/rc" >~/.bashrc

# Use ly 
yay -S --noconfirm --needed ly
sudo cp ~/.local/share/witchcraft/config/ly/config.ini /etc/ly/config.ini
sudo systemctl enable ly.service

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true
git config --global init.defaultBranch master

# Set identification from install inputs
if [[ -n "${WITCHCRAFT_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$WITCHCRAFT_USER_NAME"
fi

if [[ -n "${WITCHCRAFT_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$WITCHCRAFT_USER_EMAIL"
fi