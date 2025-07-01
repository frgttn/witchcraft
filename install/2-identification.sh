# Need gum to query for input
yay -S --noconfirm --needed gum

# Configure identification
echo -e "\nEnter identification for git..."
export WITCHCRAFT_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export WITCHCRAFT_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")
