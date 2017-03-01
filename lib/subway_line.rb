class SubwayLine

	attr_accessor :name, :status, :info_link, :details

	@@all = []

	def initialize(name, status)
		@name = name
		@status = status
		self.class.all << self
	end

	def self.all
		@@all
	end

	def self.build_lines_from_hash
		info = ServiceScraper.parse_info

		info.each do |k, v|
			self.new(k.to_s, v)
		end
	end

	def self.add_links	
		details = ServiceScraper.get_service_changes

		if !details.empty?
			details.each do |k, v|
				self.all.each do |obj|
					if obj.name == k.to_s
						obj.info_link = v
					end
				end
			end
		else
			puts "\nGood service on all lines!"
		end
	end

end