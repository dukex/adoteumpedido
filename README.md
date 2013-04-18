Adoteumpedido
=============

[![Code Climate](https://codeclimate.com/github/dukex/adoteumpedido.png)](https://codeclimate.com/github/dukex/adoteumpedido)


O Adote um Pedido veio contornar um obstáculo ao acesso à informação no Brasil: aqui, ao contrário do que acontece em outros países, não é possível solicitar informações dos órgãos públicos de forma anônima.

## Install

```
$ bundle install
$ cp config/database.yml{.example,}
$ rake db:create db:migrate
```

On **development enviroment** you can create fake data running:

```
$ rake db:bootstrap
```


## Import Authorities From Alaveteli

First we need download the Authorities and save csv in db/data/all-authorities.csv

```
$ curl 'http://queremossaber.org.br/body/all-authorities.csv' -o db/data/all-authorities.csv
```

Send it to production server and, on production server, run:

```
$ rake db:import_authorities_from_alaveteli
```

