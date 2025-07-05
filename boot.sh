ascii_art='##      ## #### ########  ######  ##     ##  ######  ########     ###    ######## ########
##  ##  ##  ##     ##    ##    ## ##     ## ##    ## ##     ##   ## ##   ##          ##   
##  ##  ##  ##     ##    ##       ##     ## ##       ##     ##  ##   ##  ##          ##   
##  ##  ##  ##     ##    ##       ######### ##       ########  ##     ## ######      ##   
##  ##  ##  ##     ##    ##       ##     ## ##       ##   ##   ######### ##          ##   
##  ##  ##  ##     ##    ##    ## ##     ## ##    ## ##    ##  ##     ## ##          ##   
 ###  ###  ####    ##     ######  ##     ##  ######  ##     ## ##     ## ##          ##   '

echo -e "\n$ascii_art\n"

pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning Witchcraft..."
rm -rf ~/.local/share/witchcraft/
git clone https://github.com/frgttn/witchcraft.git ~/.local/share/witchcraft >/dev/null

# Use custom branch if instructed
if [[ -n "$WITCHCRAFT_REF" ]]; then
  echo -e "\eUsing branch: $WITCHCRAFT_REF"
  cd ~/.local/share/witchcraft
  git fetch origin "${WITCHCRAFT_REF}" && git checkout "${WITCHCRAFT_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/witchcraft/install.sh
