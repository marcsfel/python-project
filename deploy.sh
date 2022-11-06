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

OPCAO = 1

if [ $USER = "root" ] 
then
    echo "#################################"
    echo "Deploy API-Flask + MYSQL + NGINX"
    echo "#################################"
    echo "Escolha uma das opções a seguir:"
    echo "1 - Deploy containers + build"
    echo "2 - Deploy containers"
    echo "3 - Status containers"
    echo "4 - Parar containers"
    echo "5 - Chamar API no console"
    echo "6 - Exibir URL API"
    echo "0 - Sair"
    echo

    

    while [ "$OPCAO" != 0 ]
    do
    read -p "Opção desejada: " OPCAO
    
        case "$OPCAO" in
        1)
            docker-compose up -d --build
            sleep 5
            ;;

        2)
            docker-compose up -d
            sleep 5
            ;;

        3)
            docker-compose ps
            sleep 5
            ;;

        4)
            docker-compose down
            sleep 5
            ;;

        5)
            echo -n "Response: "
            curl -X POST http://localhost:8080/paste
            ;;
        6)
            echo http://localhost:8080/paste
            ;;
        0)
            echo "Saindo..."
            sleep 3
            ;;

        *)
            echo "Opção inválida"
            sleep 3
        esac
    done

else
    echo "##########################"
    echo "Execute o script como root"
    echo "##########################"
fi
