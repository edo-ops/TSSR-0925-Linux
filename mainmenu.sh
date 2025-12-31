#!/bin/bash

# Script d'administration Linux
# Doit être exécuté en tant que root

# Couleurs pour l'affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Vérification des privilèges root
check_root() {
    if [ "$EUID" -ne 0 ]; then
        echo -e "${RED}Ce script doit être exécuté en tant que root${NC}"
        exit 1
    fi
}

# Fonction pour pause
pause() {
    echo -e "\n${YELLOW}Appuyez sur Entrée pour continuer...${NC}"
    read
}

# Menu principal
main_menu() {
    clear
echo -e "${BLUE}"
    cat << "EOF"
  ___       _             _         _       _                 _    _               
 / _ \     | |           (_)       (_)     | |               | |  (_)              
/ /_\ \  __| | _ __ ___   _  _ __   _  ___ | |_  _ __   __ _ | |_  _   ___   _ __  
|  _  | / _` || '_ ` _ \ | || '_ \ | |/ __|| __|| '__| / _` || __|| | / _ \ | '_ \ 
| | | || (_| || | | | | || || | | || |\__ \| |_ | |   | (_| || |_ | || (_) || | | |
\_| |_/ \__,_||_| |_| |_||_||_| |_||_||___/ \__||_|    \__,_| \__||_| \___/ |_| |_|

EOF
    echo -e "${NC}"
    echo ""
    echo "1. Outils réseaux"
    echo "2. Outils d'administration"
    echo "3. Installation de logiciels"
    echo "4. Quitter"
    echo ""
    echo -n "Choisissez une option: "
    read choice

    case $choice in
        1) ./Script user admin.sh ;;
        2) admin_menu ;;
        3) software_menu ;;
        4) exit 0 ;;
        *) echo -e "${RED}Option invalide${NC}"; pause; main_menu ;;
    esac
}

# Programme principal
check_root
main_menu
~
~
~
~
~
~
-- (insertion) VISUEL --                                                                         62        1,1          Tout


