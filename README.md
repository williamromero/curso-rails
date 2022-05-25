# CURSO RAILS

El siguiente proyecto es parte del Bootcamp de Ruby on Rails & React.

|Package|Version|
|-|-|
|Ruby|2.7.6|
|Rails|6.1.6|


## ACERCA DE LA APLICACIÓN

### 1. PASOS PARA INICIAR APLICACIÓN

Crear aplicación:
```
  rails new curso-rails -d mysql
```

Luego de crear la aplicación, ingresar a la carpeta
```shell
  bundle install
```

Antes de iniciar la aplicación, agregamos nuestra contraseña de MYSQL ó POSTGRESQL para que inicie la aplicación.
```yml
  # app/config/database.yml

  # Ingresar contraseña de gestor de base de datos.
  password: 1234 
```

Luego, corremos el próximo comando:
```shell
  rails db:create && rails db:migrate && rails db:seed
```

### 2. CONFIGURAR RUBOCOP

```shell
  rubocop -A
```


## Referencias

|Topic|Links|
|--|-----|
|**RVM**|
|RVM Ruby Gemsets|https://rvm.io/gemsets/basics|
|RVM Cheatsheet|https://gist.github.com/zambrose/8342046|
|RUBY|
|Ruby Releases|https://www.ruby-lang.org/en/downloads/releases/|
|**RAILS**|
|Welcome to Rails|https://edgeapi.rubyonrails.org/|
|Building new Ruby on Rails Application|https://www.bigbinary.com/learn-rubyonrails-book/new-ruby-on-rails-application|
|Rails Versions|https://rubygems.org/gems/rails/versions|
|**ACTIVE RECORD PERFORMANCE**|
|Caching in Rails 6|https://www.youtube.com/watch?v=bIZaWF2QrZM|
|Active Record Joins|https://www.youtube.com/watch?v=wjEeLjGkBeA|
|Improve performance in Ruby on Rails using Includes|https://youtu.be/Ml2HyPBef-g|
|**BEST PRACTICES**|
|Fat Model, Skinny Controller|https://riptutorial.com/ruby-on-rails/example/9609/fat-model--skinny-controller|
