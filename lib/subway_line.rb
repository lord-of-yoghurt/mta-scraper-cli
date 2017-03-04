class SubwayLine

	attr_accessor :name, :status, :info_link, :details

	@@all = []

	def initialize(line_hash)
		line_hash.each do |k, v|
			self.send("#{k}=", v)
		end
		self.class.all << self
	end

	def self.all
		@@all
	end

	def self.build_lines_from_collection
		lines = ServiceScraper.parse_info

		lines.each do |line_hash|
			self.new(line_hash)
		end
	end

	def self.find_by_name(name)
		self.all.detect { |obj| obj.name == name }
	end

	def self.update_details(line_name)
		line = self.find_by_name(line_name)
		line.details = ServiceScraper.get_details(line.info_link)
	end

end