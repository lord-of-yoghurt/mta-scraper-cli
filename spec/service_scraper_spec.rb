describe ServiceScraper do

	describe '#get_page' do
		it 'loads data from MTA\'s Subway Service page' do
			result = ServiceScraper.get_page

			test_element = result.css('meta').attribute('content').value

			expect(test_element).not_to include('dnsrsearch')
		end
	end

	describe '#parse_info' do
		it 'creates a hash with line names and the service status for each line' do
			result = ServiceScraper.parse_info

			expect(result).to include('1 2 3': a_kind_of(String))
		end

		# it 'handles links properly' do
		# 	result = ServiceScraper.parse_info

		# 	expect(result).to ???
		# end
	end

end