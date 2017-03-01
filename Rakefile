require_relative './config/environment.rb'

def reload!
	load_all "./lib"
	load_all "./config"
end

task :console do
	puts "Love it, test it <3"
	reload!
	Pry.start
end