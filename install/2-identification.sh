# Need gum to query for input
paru -S --noconfirm --needed gum

# Configure identification
if [[ -z "${WITCHCRAFT_USER_NAME//[[:space:]]/}${WITCHCRAFT_USER_EMAIL//[[:space:]]/}" ]]; then
  echo -e "\nEnter identification for git and autocomplete..."
  export WITCHCRAFT_USER_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
  export WITCHCRAFT_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")
fi