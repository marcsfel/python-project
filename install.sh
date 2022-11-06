#!/bin/bash

#############################################################################################
#                                                                                           #
# install.sh - Instalação do Docker e docker-compose                                        #
#                                                                                           #
# Autor: Marcos Mendonca (marcsfelsouza@gmail.com)                                          #
# Data Criação: 06/11/2022                                                                  #
#                                                                                           #
# Descrição: Verifica se o docker e docker-compose já estão instalados, caso negativo,      #
# realiza a instação em sistemas baseados em Debian                                         #
#                                                                                           #
# Exemplo de uso: sudo ./install.sh                                                         #
#                                                                                           #
#############################################################################################


if [ $USER = "root" ] 
then
    if ! [ "$(which curl)" ]
    then
        apt update && apt install curl -y
    fi
    if ! [ "$(which docker)" ]
    then
        curl -fsSL https://get.docker.com | bash
    fi
    if ! [ "$(which docker-compose)" ]
    then
        curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    fi

    clear
    echo "################################"
    echo "Todas as dependencias instaladas"
    echo "################################"

else
    echo "##########################"
    echo "Execute o script como root"
    echo "##########################"
fi
