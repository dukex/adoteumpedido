config = YAML.load(File.read(Rails.root.join('config/alaveteli_config.yml')))[Rails.env]
ALAVETELI_CONFIG = config
