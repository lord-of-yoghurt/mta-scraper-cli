class UI

	def run
		# upon launch, show a formatted status of each subway line
		# if any of the lines has a status other than "good service",
		#   prompt user to choose which line they want to see details for,
		#   or enter 'q' to quit

		# greeting
		# 
	end

	def show_info
		SubwayLine.build_lines_from_collection
		
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
		end
		return nil
	end

end

class String
	def brown;    "\e[33m#{self}\e[0m" end
	def gray;     "\e[37m#{self}\e[0m" end
end