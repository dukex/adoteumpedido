application = "adoteumpedido"
repository = "git://github.com/dukex/adoteumpedido.git"
hosts = ["173.255.218.86"]


before_restarting_server do
  run "service unicorn reload"
end
