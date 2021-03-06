class UI

  attr_accessor :user_input

  def run
    self.greeting
    self.show_info
    self.get_input
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
  end

  def changes?
    SubwayLine.all.any? { |obj| obj.status != 'Good Service' }
  end

  def get_input
    if changes?
      puts "\nWould you like to see details on service changes?"
      puts "Enter the exact name of the line (e.g. 'A C E') to retrieve further info,"
      print "or type 'q' to quit: "
      self.user_input = gets.strip
      exit if self.user_input == 'q'
      self.show_details
    else
      puts "\nLooks like everything is working smoothly - enjoy it while it lasts! :)"
    end
  end

  def valid_input?
    SubwayLine.all.any? { |obj| obj.name == self.user_input }
  end

  def show_details
    if self.valid_input?
      puts "----------------------------------"
      puts SubwayLine.update_details(self.user_input)
      puts "----------------------------------"
      puts "Would you like to see details for another line?"
      print "If so, enter the line name. Otherwise, enter 'q' to quit: "
      self.user_input = gets.strip
      exit if user_input == 'q'
      self.show_details
    else
      puts "We couldn't find this subway line in the list."
      print "Please enter a valid line name: "
      self.user_input = gets.strip
      self.show_details
    end
  end
end

class String
  def brown;    "\e[33m#{self}\e[0m" end
  def gray;     "\e[37m#{self}\e[0m" end
end