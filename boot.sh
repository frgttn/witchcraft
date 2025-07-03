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
git clone -b master https://github.com/frgttn/witchcraft.git ~/.local/share/witchcraft >/dev/null

echo -e "\nInstallation starting..."
source ~/.local/share/witchcraft/install.sh
