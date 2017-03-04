class UI

	attr_accessor :input

	def run
		# upon launch, show a formatted status of each subway line
		# if any of the lines has a status other than "good service",
		#   prompt user to choose which line they want to see details for,
		#   or enter 'q' to quit

		self.greeting
	end

	def show_info
		SubwayLine.build_lines_from_collection

		30.times do
			print "."
			sleep 0.04
		end
		puts

		SubwayLine::all.each do |obj|
			case obj.name
			when '1 2 3' then puts "#{obj.name.colorize( :red )} \t\t---\t\t#{obj.status}"
			when '4 5 6' then puts "#{obj.name.colorize( :green )} \t\t---\t\t#{obj.status}"
			when '7' then puts "#{obj.name.colorize( :magenta )} \t\t---\t\t#{obj.status}"
			when 'A C E' then puts "#{obj.name.colorize ( :blue )} \t\t---\t\t#{obj.status}"
			when 'B D F M' then puts "#{obj.name.colorize ( :light_red )} \t---\t\t#{obj.status}"
			when 'G' then puts "#{obj.name.colorize ( :light_green )} \t\t---\t\t#{obj.status}"
			when 'J Z' then puts "#{obj.name.brown} \t\t---\t\t#{obj.status}"
			when 'L' then puts "#{obj.name.gray} \t\t---\t\t#{obj.status}"
			when 'N Q R' then puts "#{obj.name.colorize ( :yellow )} \t\t---\t\t#{obj.status}"
			when 'S' then puts "#{obj.name.colorize ( :light_white )} \t\t---\t\t#{obj.status}"
			else puts "#{obj.name} \t\t---\t\t#{obj.status}"
			end
			sleep 0.1
		end
		return nil
	end

	def splash
		system('clear') || system('cls')
		splash = File.open('./assets/splash.md')

		splash.each_line { |line| puts line }
	end

	def greeting
		time = Time.new

		self.splash
		puts "\nHello! It is #{time.strftime("%H:%M:%S")} on #{time.strftime("%Y-%m-%d")}"
		puts "Here is the MTA service status report:"
		puts

		self.show_info
	end

	def changes?
		SubwayLine::all.any? { |obj| obj.status != 'Good Service' }
	end

	def get_input
		if changes?
			puts "\nWould you like to see details on service changes?"
			puts "Enter the exact name of the line to retrieve further info,"
			print "or type 'q' to quit: "
			self.input = gets.strip
			exit if self.input == 'q'
		else
			puts "\nAwesome! No service changes, enjoy it while it lasts :)"
		end
	end

	def show_details
		# ...
	end
end

class String
	def brown;    "\e[33m#{self}\e[0m" end
	def gray;     "\e[37m#{self}\e[0m" end
end