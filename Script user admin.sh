#!/bin/bash

# Vérifie si le script est lancé en root
if [ "$EUID" -ne 0 ]; then
    echo "Veuillez exécuter ce script en tant que root."
    exit 1
fi

while true; do
    echo "===== Gestion des utilisateurs ====="
    echo "1) Ajouter un utilisateur"
    echo "2) Supprimer un utilisateur"
    echo "3) Quitter"
    echo "==================================="
    read -p "Choisissez une option (1-3) : " choix

    case $choix in
        1)
            read -p "Nom du nouvel utilisateur : " useradd_name
            # Crée l'utilisateur avec son home directory
            useradd -m "$useradd_name"
            if [ $? -eq 0 ]; then
                echo "Utilisateur '$useradd_name' ajouté avec succès !"
                # Optionnel : demander à définir un mot de passe
                passwd "$useradd_name"
            else
                echo "Erreur lors de l'ajout de l'utilisateur."
            fi
            ;;
        2)
            read -p "Nom de l'utilisateur à supprimer : " userdel_name
            # Supprime l'utilisateur avec son home directory
            userdel -r "$userdel_name"
            if [ $? -eq 0 ]; then
                echo "Utilisateur '$userdel_name' supprimé avec succès !"
            else
                echo "Erreur lors de la suppression de l'utilisateur."
            fi
            ;;
        3)
            echo "Au revoir !"
            exit 0
            ;;
        *)
            echo "Option invalide. Veuillez choisir entre 1 et 3."
            ;;
    esac
    echo ""
done
