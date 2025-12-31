#!/bin/bash

# Couleurs
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

# Variables
IP=$(ip addr show | grep -w inet | grep -v 127.0.0.1 | awk '{print $2}')
MAC=$(ip link show | grep -w ether | awk '{print $2}')
GW=$(ip route | grep default | awk '{print $3}')

# Fonctions
menu()
{
        echo -e "${BLUE}"
cat <<'EOF'
==========================================
==========================================
  _____
 |  __ \
 | |__) |___  ___  ___  __ _ _   ___  __
 |  _  // _ \/ __|/ _ \/ _` | | | \ \/ /
 | | \ \  __/\__ \  __/ (_| | |_| |>  <
 |_|  \_\___||___/\___|\__,_|\__,_/_/\_\
==========================================
==========================================
EOF
        echo -e "${RESET}"

        echo
        echo -e "${BLUE}1) afficher l'adresse IP${RESET}"
        echo -e "${BLUE}2) afficher l'adresse MAC${RESET}"
        echo -e "${BLUE}3) afficher la Gateway${RESET}"
        echo -e "${BLUE}4) tester le ping${RESET}"
        echo -e "${YELLOW}5) quitter${RESET}"
}

error()
{
        echo -e "${RED}Erreur : $1${RESET}"
}

test_ping()
{
        echo ""
        echo -e "${YELLOW}Test de connexion en cours...${RESET}"
        echo ""

        if ping -c 1 8.8.8.8 > /dev/null; then
                echo -e "${GREEN}Connexion OK${RESET}"
        else
                echo -e "${RED}Pas de réseau${RESET}"
        fi

        echo ""
        read -p "Appuyez sur Entrée pour continuer..."
}

# Corps principal du script
while true; do
        clear
        menu
        read -p "Choisir une action : " choice

        case "$choice" in
                1)
                        echo ""
                        echo -e "${GREEN}L'adresse IP est : ${CYAN}$IP${RESET}"
                        echo ""
                        read -p "Appuyez sur Entrée pour continuer..."
                        ;;
                2)
                        echo ""
                        echo -e "${GREEN}L'adresse MAC est : ${CYAN}$MAC${RESET}"
                        echo ""
                        read -p "Appuyez sur Entrée pour continuer..."
                        ;;
                3)
                        echo ""
                        echo -e "${GREEN}La Gateway est : ${CYAN}$GW${RESET}"
                        echo ""
                        read -p "Appuyez sur Entrée pour continuer..."
                        ;;
                4)
                        test_ping
                        ;;
                5)
                        echo ""
                        echo -e "${YELLOW}Au revoir${RESET}"
                        echo ""
                        sleep 1
                        ./mainmenu.sh
                        exit 0
                        ;;
                *)
                        echo ""
                        error "choix invalide, veuillez réessayer"
                        echo ""
                        sleep 1
                        ;;
        esac
done
