#!/bin/bash

#################################################################################################
#                                                                                               #
# deploy.sh - Deploy e informações dos containers                                               #
#                                                                                               #
# Autor: Marcos Mendonca (marcsfelsouza@gmail.com)                                              #
# Data Criação: 06/11/2022                                                                      #
#                                                                                               #
# Descrição: Realiza o deploy, build e pega informações do container, além da posibilidade      #
# de realizar o stop                                                                            #
#                                                                                               #
# Exemplo de uso: sudo ./deploy.sh                                                              #
#                                                                                               #
# Problemas conhecidos: Pode haver erro no docker-compose up dependendo da versão do compose    #
# instalada, verificar como atualizar o compose ou adaptar para versões mais antigas            #
#                                                                                               #
# Versão do docker-compose usada: 1.29                                                          #
#################################################################################################


if [ $USER = "root" ] 
then

    echo "#################################"
    echo "Deploy API-Flask + MYSQL + NGINX"
    echo "#################################"

    while [ "$opcao" != 0 ]
    do
    echo "Escolha uma das opções a seguir:"
    echo "1 - Deploy containers + build"
    echo "2 - Deploy containers"
    echo "3 - Status containers"
    echo "4 - Parar containers"
    echo "5 - Chamar API no console"
    echo "6 - Exibir URL API"
    echo "0 - Sair"
    echo
    read -p "Opção desejada: " opcao
    
        case "$opcao" in
        1)
            docker-compose up -d --build
            sleep 10
            ;;

        2)
            docker-compose up -d
            sleep 10
            ;;

        3)
            docker-compose ps
            sleep 20
            ;;

        4)
            docker-compose down
            sleep 10
            ;;

        5)
            echo -n "Response: "
            curl -X POST http://localhost:8080/paste
            sleep 20
            ;;
        6)
            echo http://localhost:8080/paste
            sleep 20
            ;;
        0)
            echo "Saindo..."
            sleep 5
            ;;

        *)
            echo "Opção inválida"
            sleep 5
        esac
    done

else
    echo "##########################"
    echo "Execute o script como root"
    echo "##########################"
fi
