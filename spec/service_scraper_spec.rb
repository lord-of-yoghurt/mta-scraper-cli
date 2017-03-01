describe ServiceScraper do

	let(:test_url) { './fixtures/example_page.htm' }

	describe '#get_page' do
		it 'loads data from MTA\'s Subway Service page' do
			result = ServiceScraper.get_page(test_url) # get rid of argument when finished with test suite

			test_element = result.css('meta').attribute('content').value

			expect(test_element).not_to include('dnsrsearch')
		end
	end

	describe '#parse_info' do
		it 'creates a hash with line names and the service status for each line' do
			result = ServiceScraper.parse_info(test_url)

			expect(result).to include('1 2 3': a_kind_of(String))
		end
	end

	describe '#service_changes' do
		it 'creates a hash with lines that have service changes and links for further info' do
			result = ServiceScraper.service_changes(test_url)

			expect(result).to include(a_kind_of(Symbol) => a_kind_of(String))
		end
	end

end