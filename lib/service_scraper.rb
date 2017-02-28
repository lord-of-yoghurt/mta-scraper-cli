class ServiceScraper

	URL = 'http://assistive.usablenet.com/tt/www.mta.info/?un_jtt_v_status=subwayTab'

	def self.get_all_info
		Nokogiri::HTML(open(URL))
	end
	
end