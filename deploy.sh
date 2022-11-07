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
    echo "3 - Deploy com scaling de containers da API"
    echo "4 - Status containers"
    echo "5 - Parar containers"
    echo "6 - Chamar API no console"
    echo "7 - Exibir URL API"
    echo "0 - Sair"
    echo
    echo "** Sempre que realizar alguma alteração na api execute a opção 1 para realizar o build **"
    echo
    read -p "Opção desejada: " opcao
    
        case "$opcao" in
        1)
            docker-compose up -d --build
            echo "#################################"
            echo "Carregando menu..."
            sleep 5
            clear
            ;;

        2)
            docker-compose up -d
            echo "#################################"
            echo "Carregando menu..."
            sleep 5
            clear
            ;;

        3)  
            read -p "Digite quantos containers deseja subir para a API: " SCALING
            docker-compose up -d --scale api=$SCALING
            echo "#################################"
            echo "Carregando menu..."
            sleep 5
            clear
            ;;

        4)
            docker-compose ps
            echo "#################################"
            echo "Carregando menu..."
            sleep 15
            clear
            ;;

        5)
            docker-compose down
            echo "#################################"
            echo "Carregando menu..."
            sleep 5
            clear
            ;;

        6)
            echo
            echo -n "Response: "
            curl -X POST http://localhost:8080/paste
            echo
            echo
            echo "#################################"
            echo "Carregando menu..."
            sleep 10
            clear
            ;;
        7)
            echo http://localhost:8080/paste
            echo "#################################"
            echo "Carregando menu..."
            sleep 10
            clear
            ;;
        0)
            echo "Saindo..."
            sleep 5
            ;;

        *)
            echo "Opção inválida"
            echo "#################################"
            echo "Carregando menu..."
            sleep 5
            clear
            ;;
        esac
    done

else
    echo "##########################"
    echo "Execute o script como root"
    echo "##########################"
fi
