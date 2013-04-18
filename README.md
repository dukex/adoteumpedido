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

## Hide User?

On app level, the ```config/initializers/hide_ip.rb``` file hide user IP, the
request log will like that

```
Started GET "/assets/application.js?body=1" for ###.##.##.### at 2013-04-18 11:13:01 -0300
```

### Why not disable log?

I tried it, sent the log to ```/dev/null```, that was a bad idea!




