require_relative './config/environment.rb'

def reload!
	load_all "./lib"
	load_all "./config"
end

task :console do
	puts "Welcome to the console!"
	reload!
	Pry.start
end