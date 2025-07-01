# Copy over Witchcraft configs
cp -R ~/.local/share/witchcraft/config/* ~/.config/

# Use default bashrc from Witchcraft
echo "source ~/.local/share/witchcraft/default/bash/rc" >~/.bashrc

# Use sddm 
yay -S --noconfirm --needed sddm
sudo systemctl enable sddm

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${WITCHCRAFT_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$WITCHCRAFT_USER_NAME"
fi

if [[ -n "${WITCHCRAFT_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$WITCHCRAFT_USER_EMAIL"
fi