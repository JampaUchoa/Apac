# Microserviço de coleta manual APAC

### Microservicos integrados
- AngularJS
- Rails
- PostgreSQL

### Setup

1. Buildar o front e o back
`docker-compose build`

2. Subir a VM
`docker-compose up`

3. Se conectar com o Rails para criar o banco, criar entidades, e popular com o arquivo /db/seeds.db
`docker-compose run web rake db:create db:schema:load db:seed`

4. Acessar o front-end angular
[localhost:8000](http://localhost:8000/)
