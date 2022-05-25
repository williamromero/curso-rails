# CURSO RAILS

El siguiente proyecto es parte del Bootcamp de Ruby on Rails & React.

|Package|Version|
|-|-|
|Ruby|2.7.6|
|Rails|6.1.6|
<br>

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

### 2. CREAR ESTRUCTURA CON SCAFFOLDS

Un **scaffold** en Rails es un conjunto completo de modelo, migración de base de datos para el modelo, controlador para manipularlo, vistas para ver y manipular los registros y un conjunto de pruebas para cada uno de los anteriores.
El generador crea un modelo, las vistas, el controlador, las rutas, los tests y la migración de base de datos (la que crea la tabla).

```shell
rails g scaffold Product name:string description:string stock:integer 'price:decimal{10,2}'
```

Lo cual generará los siguientes archivos:
```shell
  Running via Spring preloader in process 17743
      invoke  active_record
      create    db/migrate/20220525155708_create_products.rb
      create    app/models/product.rb
      invoke    test_unit
      create      test/models/product_test.rb
      create      test/fixtures/products.yml
      invoke  resource_route
       route    resources :products
      invoke  scaffold_controller
      create    app/controllers/products_controller.rb
      invoke    erb
      create      app/views/products
      create      app/views/products/index.html.erb
      create      app/views/products/edit.html.erb
      create      app/views/products/show.html.erb
      create      app/views/products/new.html.erb
      create      app/views/products/_form.html.erb
      invoke    resource_route
      invoke    test_unit
      create      test/controllers/products_controller_test.rb
      create      test/system/products_test.rb
      invoke    helper
      create      app/helpers/products_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/products/index.json.jbuilder
      create      app/views/products/show.json.jbuilder
      create      app/views/products/_product.json.jbuilder
      invoke  assets
      invoke    scss
      create      app/assets/stylesheets/products.scss
      invoke  scss
   identical    app/assets/stylesheets/scaffolds.scss
```

Scaffolds no son recomendados sino es para apps de prueba CRUD.
<br>

#### 3. GENERADORES

Ya que hemos visto lo que puede hacer el generador **scaffold**, es oportuno conocer que Rails nos brinda otros generadores con los que se pueden generar los modelos, controloadores u otros de forma individual.
Si colocamos el siguiente comando, podemos ver que otras cosas podemos generar:
```shell
  rails generate
```

Y obtendremos lo siguiente:
```shell
  Usage: rails generate GENERATOR [args] [options]

  General options:
    -h, [--help]     # Print generator's options and usage
    -p, [--pretend]  # Run but do not make any changes
    -f, [--force]    # Overwrite files that already exist
    -s, [--skip]     # Skip files that already exist
    -q, [--quiet]    # Suppress status output

  Please choose a generator below.

  Rails:
    application_record
    assets
    benchmark
    channel
    controller
    generator
    helper
    integration_test
    jbuilder
    job
    mailbox
    mailer
    migration
    model
    resource
    scaffold
    scaffold_controller
    system_test
    task

  ActiveRecord:
    active_record:application_record

  RackProfiler:
    rack_profiler:install

  TestUnit:
    test_unit:channel
    test_unit:generator
    test_unit:install
    test_unit:mailbox
    test_unit:plugin

```

Por ejemplo, si necesitamos crear únicamente un controlador, sin vistas ni modelo, podremos utilizar el siguiente comando. Para definir el nombre de los controladores, siempre generarlos en **PLURAL**:

```ruby
  # rails generate controller [NAME in plural][actions names]
  rails generate controller CreditCards principal payment
```

Y automáticamente se generará el **controlador**, las rutas, las pruebas y los assets.

```
  create  app/controllers/credit_cards_controller.rb
    route  get 'credit_cards/principal'
          get 'credit_cards/payment'

  invoke  erb
  create    app/views/credit_cards
  create    app/views/credit_cards/principal.html.erb
  create    app/views/credit_cards/payment.html.erb
  invoke  test_unit
  create    test/controllers/credit_cards_controller_test.rb
  invoke  helper
  create    app/helpers/credit_cards_helper.rb
  invoke    test_unit
  invoke  assets
  invoke    scss
  create      app/assets/stylesheets/credit_cards.scss
```

Si deseamos crear un modelo, podemos utilizar el comando:

```ruby
  # rails generate model NAME [field[:type][:index] field[:type][:index]] [options]
  rails generate model CreditCard no_card:string owner:string provider:string
```

Y el generador creará la clase de migración, que nos permitirá crear la tabla **credit_cards**:

```shell
  invoke  active_record
  create    db/migrate/20220525170350_create_credit_cards.rb
  create    app/models/credit_card.rb
  invoke    test_unit
  create      test/models/credit_card_test.rb
  create      test/fixtures/credit_cards.yml
```

Luego, para que la tabla nueva sea creada, tenemos que correr las migraciones que existan pendientes en nuestro proyecto. Para listarlas, necesitamos utilizar el siguiente comando:

```
  rails db:migrate:status

  database: curso_rails_dev

  Status   Migration ID    Migration Name
  --------------------------------------------------
    up     20220525144025  ********** NO FILE **********
    down    20220525155708  Create products
    down    20220525170350  Create credit cards
```

Si tenemos migraciones en **down**, significa que debemos de correr las migraciones antes de inicializar nuestra aplicación:

```shell
  rails db:migrate

== 20220525155708 CreateProducts: migrating ===================================
-- create_table(:products)
  -> 0.0937s
== 20220525155708 CreateProducts: migrated (0.0938s) ==========================

== 20220525170350 CreateCreditCards: migrating ================================
-- create_table(:credit_cards)
  -> 0.0315s
== 20220525170350 CreateCreditCards: migrated (0.0316s) =======================
```

Ahora si, luego de haber corrido las migraciones, podemos correr la aplicación de nuevo:

```
  rails s
```

### X. CONFIGURAR RUBOCOP

```shell
  rubocop -A
```


## Referencias
<br>

**RVM**
|Topic|Links|
|--|-----|
|RVM Ruby Gemsets|https://rvm.io/gemsets/basics|
|RVM Cheatsheet|https://gist.github.com/zambrose/8342046|
<br>

**RUBY**
|Topic|Links|
|--|-----|
|Ruby Releases|https://www.ruby-lang.org/en/downloads/releases/|
<br>

**RAILS**
|Topic|Links|
|--|-----|
|Welcome to Rails|https://edgeapi.rubyonrails.org/|
|Building new Ruby on Rails Application|https://www.bigbinary.com/learn-rubyonrails-book/new-ruby-on-rails-application|
|Rails Versions|https://rubygems.org/gems/rails/versions|
|Rails Generators|https://guides.rubyonrails.org/command_line.html#bin-rails-generate|
|Rails Specific Generators|https://www.rubyguides.com/2020/03/rails-scaffolding/|
|Rails Generate Commands|https://riptutorial.com/ruby-on-rails/example/9630/rails-generate-scaffold|
|**CONSOLE**|
|Rails Command Line|https://guides.rubyonrails.org/command_line.html|
<br>

**MIGRACIONES**
|Topic|Links|
|--|-----|
|Generador de Migraciones|https://mitrev.net/rails/2015/04/19/rails-migration-generator-specifying-precision-and-scale/|
<br>

**ACTIVE MODEL**
|Topic|Links|
|--|-----|
|Renderizar JSON con Rails & Active Model Serializer|https://medium.com/academia-hack/renderizar-jsons-con-rails-y-active-model-serializer-98268a26c56c|
|Active Model Serialization|https://api.rubyonrails.org/classes/ActiveModel/Serialization.html|
<br>

**ACTIVE RECORD PERFORMANCE**
|Topic|Links|
|--|-----|
|Caching in Rails 6|https://www.youtube.com/watch?v=bIZaWF2QrZM|
|Active Record Joins|https://www.youtube.com/watch?v=wjEeLjGkBeA|
|Improve performance in Ruby on Rails using Includes|https://youtu.be/Ml2HyPBef-g|
<br>

**BEST PRACTICES**
|Topic|Links|
|--|-----|
|Fat Model, Skinny Controller|https://riptutorial.com/ruby-on-rails/example/9609/fat-model--skinny-controller|
<br>

**AUTHENTICATION**
|Topic|Links|
|--|-----|
|The Bcrypt Hashing| https://manny.codes/understanding-the-bcrypt-hashing-function-and-its-role-in-rails/|
