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
        apt install curl
    fi
    if ! [ "$(which docker)" ]
    then
        curl -fsSL https://get.docker.com | bash
    fi
    if ! [ "$(which docker-compose)" ]
    then
        apt update && apt install docker-compose -y
    fi

    echo "Todas as dependencias instaladas"

else
    echo "Execute o script como root"
fi
