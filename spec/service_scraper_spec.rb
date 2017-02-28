describe ServiceScraper do

	context '#get_all_info'
		it 'loads data from MTA\'s Subway Service page' do
			result = ServiceScraper.get_all_info

			test_element = result.css('meta').attribute('content').value

			expect(test_element).not_to include('dnsrsearch')
		end
	end

end