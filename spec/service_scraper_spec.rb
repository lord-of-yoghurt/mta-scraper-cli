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
		it 'returns an array of hashes for each subway lines' do
			result = ServiceScraper.parse_info(test_url)

			expect(result).to include({name: '1 2 3', status: 'Good Service'})
		end

		it 'parses links where appropriate' do
			result = ServiceScraper.parse_info(test_url)

			expect(result).to include({name: '4 5 6', status: 'Planned Work', info_link: 'http://assistive.usablenet.com/tt/www.mta.info/status/subway/456/24805646'})
			expect(result.first).not_to include(:info_link)
		end
	end

	describe '#get_details' do
		it 'receives details on a service change from dedicated page' do
			details = ServiceScraper.get_details('./fixtures/example_svc_chg.htm')

			expect(details).not_to be_nil
		end
	end

end