#!/bin/bash

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

clear
echo -e "${GREEN}=== OUTILS D'ADMINISTRATION UTILISATEURS ===${NC}"

# Ajouter un utilisateur
ajouter_utilisateur() {
    echo -e "${BLUE}➕ AJOUT UTILISATEUR${NC}"
    read -p "Nom utilisateur : " USERNAME
    read -s -p "Mot de passe : " PASSWORD
    echo
    
    if id "$USERNAME" &>/dev/null; then
        echo -e "${RED}❌ $USERNAME existe déjà${NC}"
    else
        sudo useradd -m -s /bin/bash "$USERNAME" && \
        echo "$USERNAME:$PASSWORD" | sudo chpasswd && \
        sudo usermod -aG sudo "$USERNAME" && \
        echo -e "${GREEN}✅ $USERNAME créé (admin + home)${NC}"
    fi
    read -p "Appuyez sur Entrée pour continuer..."
}

# Supprimer un utilisateur
supprimer_utilisateur() {
    echo -e "${BLUE}➖ SUPPRESSION UTILISATEUR${NC}"
    echo "Utilisateurs disponibles :"
    cut -d: -f1 /etc/passwd | tail -n +11
    echo
    read -p "Nom à supprimer : " USERNAME
    
    if id "$USERNAME" &>/dev/null; then
        sudo userdel -r "$USERNAME" && \
        echo -e "${GREEN}✅ $USERNAME supprimé (home inclus)${NC}" || \
        echo -e "${RED}❌ Erreur suppression${NC}"
    else
        echo -e "${RED}❌ $USERNAME n'existe pas${NC}"
    fi
    read -p "Appuyez sur Entrée pour continuer..."
}

# ✅ FONCTION CORRIGÉE
lister_utilisateurs() {
    echo -e "${GREEN}📋 UTILISATEURS SYSTÈME${NC}"
    echo "-------------------------"
    cut -d: -f1 /etc/passwd | tail -n +11 | nl
    echo "-------------------------"
    echo -e "${YELLOW}$(cut -d: -f1 /etc/passwd | tail -n +11 | wc -l) utilisateur(s)${NC}"
    read -p "Appuyez sur Entrée pour continuer..."
}

# Changer mot de passe
changer_motdepasse() {
    echo -e "${BLUE}🔑 CHANGER MOT DE PASSE${NC}"
    read -p "Nom utilisateur : " USERNAME
    
    if id "$USERNAME" &>/dev/null; then
        sudo passwd "$USERNAME" && \
        echo -e "${GREEN}✅ Mot de passe changé pour $USERNAME${NC}"
    else
        echo -e "${RED}❌ $USERNAME n'existe pas${NC}"
    fi
    read -p "Appuyez sur Entrée pour continuer..."
}

# Menu principal ✅ CORRIGÉ
PS3="Choisissez une option : "
options=("➕ Ajouter utilisateur" "➖ Supprimer utilisateur" "📋 Lister utilisateurs" "🔑 Changer mot de passe" "❌ Quitter")

while true; do
    echo
    select opt in "${options[@]}"; do
        case $REPLY in
            1) ajouter_utilisateur ;;
            2) supprimer_utilisateur ;;
            3) lister_utilisateurs ;;    # ✅ CORRIGÉ ICI
            4) changer_motdepasse ;;
            5)
                echo -e "${YELLOW}Au revoir !${NC}"
                exit 0
                ;;
            *) echo -e "${RED}Option invalide${NC}" ;;
        esac
        break
    done
done
