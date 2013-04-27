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

### on App

On app level, the ```config/initializers/hide_ip.rb``` file hide user IP, the
request log will like that

```
Started GET "/assets/application.js?body=1" for ###.##.##.###
```

Why not disable log? I tried it, sent the log to ```/dev/null```, that was a bad
idea! the app logs are important to debug app

### on Web Server

We need only disable web server log, please see the your web server manual,
on nginx, for example, the ```access_log``` var can be ```off```

#### Using heroku

The Heroku has your log acess, to use heroku we need create a small proxy, you can
use amazon for it. Given my app address is adoteumpedido.herokuapp.com, we configure
the nginx on amazon with that config:

````
http {
  upstream adoteumpedido{
    server adoteumpedido.herokuapp.com:80; # adoteumpedido instance
  }

  server {
    listen       80;
    server_name  adoteumpedido.info; # adoteumpedido address
    error_log off;
    access_log off;

    location ~ / {
      index  index.html index.htm;
      proxy_set_header X-Real-IP 111.111.11.11;
      proxy_set_header X-Forwarded-For 111.111.11.111;
      proxy_set_header Host $http_host;
      proxy_redirect off;
      proxy_max_temp_file_size 0;
      proxy_pass http://adoteumpedido;
    }
  }
}
```

Feel free to updated it, I put only the basic config to proxy

