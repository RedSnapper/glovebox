APP_CONFIG = if File.exists? "#{Rails.root}/config/config.yml"
  YAML.load_file "#{Rails.root}/config/config.yml"
else
  nil
end
