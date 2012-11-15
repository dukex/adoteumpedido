application = "adoteumpedido"
repository = "git://github.com/dukex/adoteumpedido.git"
hosts = ["173.255.218.86"]


before_restarting_server do
  rake "assets:precompile"
end

after_restarting_server do
  run "kill -s USR2 `cat /var/local/apps/adoteumpedido/tmp/pids/unicorn.pid`"
end
