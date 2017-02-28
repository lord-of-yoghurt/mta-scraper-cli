describe ServiceScraper do

	it 'loads data from MTA\'s Subway Service page' do
		result = ServiceScraper.get_all_info

		expect(result).not_to be_empty
	end
end