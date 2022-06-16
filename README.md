# CURSO RAILS

El siguiente proyecto es parte del Bootcamp de Ruby on Rails & React.

|Package|Version|
|-|-|
|Ruby|2.7.6|
|Rails|6.1.6|
|MySQL|5.7|
<br>

## ▶ WIKI DEL PROYECTO

|No. | Temas & Procedimientos creados en las Sesiones |
|-|-|
|1.| [Crear aplicación en Ruby on Rails](https://github.com/williamromero/curso-rails/wiki/1.-Crear-aplicaciones-en-Ruby-on-Rails)|
|2.| [Scaffolds :: Generador de Estructuras](https://github.com/williamromero/curso-rails/wiki/2.-Scaffolds-::-Generador-de-Estructuras)|
|3.| [Generadores :: Comandos de Consola](https://github.com/williamromero/curso-rails/wiki/3.-Generadores-::-Comandos-de-Consola--%F0%9F%8F%97%EF%B8%8F)|
|4.| [Instalación de gema Annotate](https://github.com/williamromero/curso-rails/wiki/4.-Instalaci%C3%B3n-de-Annotate-GEM)|
|5.| [Instalación de gema Foreman](https://github.com/williamromero/curso-rails/wiki/5.-Instalar-Foreman-GEM)|
|6.| [Instalación de Entorno de Pruebas](https://github.com/williamromero/curso-rails/wiki/6.-Instalaci%C3%B3n-de-Entorno-de-Pruebas)|
|7.| [ORM & ActiveRecord](https://github.com/williamromero/curso-rails/wiki/7.-ORM-&-ActiveRecord)|
|8.| [Rack Cors Configuration](https://github.com/cyu/rack-cors) |
|9.| [ORM & Relaciones](https://github.com/williamromero/curso-rails/wiki/9.-ORM-&-Relaciones) |
<br>

### DOCKER COMMANDS

First steps to create and orquestate containers:

```shell
  # Orquestate containers and volumes
  docker-compose build

  # Start containers with docker-compose
  docker-compose up
```

Luego, de iniciar la aplicación, abrimos otra ventana y creamos la base de datos.

```shell
  # Create database
  docker-compose run app bundle exec rake db:create

  # Create tables
  docker-compose run app bundle exec rake db:migrate

  # Import data test
  docker-compose run app bundle exec rake db:seed

  # Command to erase container and images
  docker rm -f $(docker ps -a -q) && sleep 2 && docker rmi -f $(docker images -a -q)
  # Ref: https://stackoverflow.com/questions/50294380/failing-to-remove-stopped-docker-container      
```

### FOREMAN COMMANDS

**Creation of Procfile.dev file**

```shell
  # Procfile.dev
  
  web: bundle exec rails s
  webpacker: ./bin/webpack-dev-server
```

**Run with Procfile**

```shell
  foreman start -f Procfile.dev
```
