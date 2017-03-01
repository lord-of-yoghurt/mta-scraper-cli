class ServiceScraper

	URL = 'http://assistive.usablenet.com/tt/www.mta.info/?un_jtt_v_status=subwayTab'

	def self.get_page(url=URL)
		Nokogiri::HTML(open(url))
	end

	def self.parse_info(url=URL)
		data = self.get_page(url)
		lines = data.css('ul')[1].css('li')
		info = Hash.new

		lines.each do |line|
			line_name = line.text.gsub(/ Subway.+/, '').strip
			status = line.css('strong').text
			next if line_name.include?('Staten') # add this back later?

			info[line_name.to_sym] = status
		end

		info
	end

	def self.service_changes(url=URL)
		data = self.get_page(url)
		lines = data.css('ul')[1].css('li')
		problems = Hash.new

		# finish up
	end

end

# ServiceScraper.parse_info => {'1 2 3': 'Good Service', '4 5 6': 'Planned Work'}
# ServiceScraper.service_changes => {'1 2 3': '/tt/www.mta.info/status/subway/123/24805471'}

# data = Nokogiri::HTML(open('http://assistive.usablenet.com/tt/www.mta.info/?un_jtt_v_status=subwayTab'))
# lines = data.css('ul')[1].css('li')
# good_service = lines.select { |obj| obj.css('strong').text == 'Good Service' }
# planned_work = lines.select { |obj| obj.css('strong').text == 'Planned Work' }
# service_change = lines.select { |obj| obj.css('strong').text == 'Service Change' }