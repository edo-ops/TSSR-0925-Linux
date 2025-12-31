#!/bin/bash

# ============================
# Script d'installation TSSR
# ============================
cd ~
rm -rf TSSR-0925-Linux
git clone https://github.com/edo-ops/TSSR-0925-Linux
cd TSSR-0925-Linux/
chmod +x *.sh
dos2unix *.sh
./mainmenu.sh
