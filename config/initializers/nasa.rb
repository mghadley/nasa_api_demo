if Rails.env.development?
	nasa = "#{Rails.root}/config/nasa.yml"
	if File.exists? nasa
		config = YAML.load_file(nasa)
		config.each { |key, value| ENV[key] = value }
	else
		raise "You must create a nasa.yml file and put your nasa api key in it"
	end
end