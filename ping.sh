#!/bin/bash
# Script Vérification réseau - TSSR

if ping -c 1 8.8.8.8 > /dev/null; then
    echo "Connexion OK"
else
    echo "Pas de réseau"
fi
