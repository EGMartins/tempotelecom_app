
# Tempotelecom

Uma simples aplicação para notações de tarefas e um web scrapper para recolher os 20 primeiros resultados da pesquisa no Google pela palacra Tempotelecom e gravá-las no banco de dados.




## Características

- CRUD para notação de tarefas
- Web scrapper do Google Search
- Possuí internacionalização para Protugeês e Inglês


## Tecnologias

Ruby (2.6.3) \
Ruby on Rails (4.2.10) \
Postgres \
Redis \
Sidekiq \
Docker \
Docker Compose


## Installation

**IMPORTANTE:**

Antes de utilizar esta aplicação, certifique-se de que possuí **Docker** e **Docker Compose** devidamente instalados

**Próximos passos**

Clonar o projeto do Github e acessar seu diretório

```bash
  git clone git@github.com:EGMartins/tempotelecom_app.git
  cd tempotelecom_app
```
A aplicação possí um arquivo `Make` para facilitar a execução dos comandos para gerenciamento da aplicação.

Para a criação dos contaimers que serão utilizados digite o comando:

```bash
  make run-app-d
```

Após a finalização da criação, vamos criar o banco de dados e rodar as migrações

```bash
  make db-create
  make db-migrate
```
Após a finalização já pode acessar `localhost:3000` para ter acesso à aplicação.
 
Para parar a execução da aplicação utilizamos o comando

```bash
  make stop-app
```

O seguinte comando deve ser executado para parar a aplicação e excluir todos os volumes criados

```bash
  make stop-app-d
```

## Running Tests

Para a execução dos testes basta executar o comando

```bash
  make run-tests
```
Os resultados são exibidos durante a execução.

## Authors

- [@EGMartins](https://www.github.com/egmartins)

