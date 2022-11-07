
# API Flask + Docker + MYSQL + NGINX

API utilizando Flask para realizar conexão com banco de dados e colar uma determinada string, retornando em seguida um HttpResponse.


O ambiente consiste em 3 containers, sendo o primeiro: API, o segundo: banco de dados (utilizado MYSQL) e terceiro: proxy reverso NGINX.

A API poderá ser escalada em mais containers, utilizando o ```docker-compose```.


## Instalação

Realizar a instalação do Git, Docker e docker-compose seguindo as instruções de acordo com seu sistema operacional. 

**( Caso seu sistema seja baseado em Debian, fazer apenas a instalação do Git para realizar o clone do projeto e rodar o script `install.sh` com privilégios de root.  Se necessário, dê permissão de execução com o comando `chmod +x install.sh`)**

#### Versões compatíveis 
* Docker >= 20.0
* docker-compose >= 1.29

#### Links
- Instalar [GIT](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- Instalar [Docker](https://docs.docker.com/get-docker/)
- Instalar [docker-compose](https://docs.docker.com/compose/install/)


#### Clonar projeto:
 ```bash
git clone https://github.com/marcsfel/python-project
```

#### 


    

## Variáveis de Ambiente

Para rodar esse projeto, você vai precisar editar as seguintes variáveis no arquivo .env

`MYSQL_DATABASE` - 
Banco de dados que será criado no deploy do ambiente e usado na API.

`MYSQL_ROOT_PASSWORD` - Senha para usuário ROOT.

`MYSQL_USER` - Usuário que será utilizado na API.

`MYSQL_PASSWORD` - Senha do usuário criado acima.

`STRING_API` - String que será inserida na API.


## Deploy

Se estiver utilizando um sistema baseado em Debian basta executar com privilégios de root o script `deploy.sh`
Para isso, talvez seja necessário dar permissão de execução no script com o seguinte comando:

```bash
chmod +x deploy.sh
```

Caso não queira utilizar o script. basta executar os seguintes comandos na raíz do projeto:



#### Realiza o build e sobe os containers:
```bash
docker-compose up -d --build
```

#### Sobe os containers (caso seja a primeira vez, ele também realizará o build):
```bash
docker-compose up -d
```

#### Sobe os containers e escala a API para o número de containers desejado:
```bash
docker-compose up -d --scale api=qtdContainers
```

#### Verifica containers rodando no momento:
```bash
docker-compose ps
```

#### Finaliza todos os containers em execução:
```bash
docker-compose down
```

#### Realizar teste de chamada da API:
```bash
curl http://localhost:8080/paste
```

### Todos os comandos acima estão presentes no script de Deploy



## Demonstração

Para realizar o teste da API basta acessar a URL abaixo no seu navegador e conferir se haverá o retorno da string configurada no arquivo `.env`

<http://localhost:8080/paste>

A API realizará a inserção no banco apenas quando for chamada pelo PATH /paste

Atualmente, não há mais nenhum PATH configurado.



## Funcionalidades

### API
- Cadastrar string em um banco de dados (Atualmente o MYSQL, mas pode ser alterado na API e no docker-compose.yml)

### Scripts
- Instalação do Docker e docker-compose em sistemas baseados em Debian
- Deploy da API em sistemas baseados em Debian


## Melhorias

- Usar variável de ambiente para escolher qual banco de dados será usado.
- Adicionar logs no proxy para avaliar para quais containers da API ele está redirecionando.
- Modificar os scripts para realizar instalação do Docker e o deploy em outros sistemas operacionais.