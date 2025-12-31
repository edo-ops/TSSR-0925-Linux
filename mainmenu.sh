#!/bin/bash
## VARIABLES
RED="\e[31m"
GREEN="\e[32m"
WHITE="\e[37m"
RESET="\e[0m" #balise pour stopper la couleur
BOLD="\e[1m" #afficher en gras
UNDERLINE="\e[4m" #souligner
## FONCTIONS
show_menu(){
    clear
    echo -e "${RED}"
    cat << 'EOF'

  ___       _             _         _       _                 _    _
 / _ \     | |           (_)       (_)     | |               | |  (_)
/ /_\ \  __| | _ __ ___   _  _ __   _  ___ | |_  _ __   __ _ | |_  _   ___   _ __
|  _  | / _` || '_ ` _ \ | || '_ \ | |/ __|| __|| '__| / _` || __|| | / _ \ | '_ \
| | | || (_| || | | | | || || | | || |\__ \| |_ | |   | (_| || |_ | || (_) || | | |
\_| |_/ \__,_||_| |_| |_||_||_| |_||_||___/ \__||_|    \__,_| \__||_| \___/ |_| |_|



EOF
echo -e "${RESET}"  
  
 echo -e "${WHITE}"
 cat << 'EOF'
  1) Outils réseaux
  2) Administration
  3) Logiciel

EOF
echo -e "${RESET}"
    echo
    echo -e "${RED}  4) Quitter${RESET}"
    echo
    echo
    echo -ne "${WHITE}  Votre choix : ${RESET}"
}
## BOUCLE PRINCIPALE
while true; do
    show_menu
    read choice
    case "$choice" in
        1)
            ./reseaux.sh
            ;;
        2)
            ./admin.sh
            ;;
        3)
            ./logiciels.sh
            ;;
        4)
            echo -e "${BOLD}Au revoir ! 👋${RESET}"
            exit 0
            ;;
        *)
            echo -e "Choix invalide, veuillez réessayer"
            sleep 1
            ;;
    esac
done



