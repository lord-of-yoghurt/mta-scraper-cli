describe SubwayLine do

	let(:test_line) { SubwayLine.new('1 2 3', 'Planned Work') }

	it 'initializes with name and status' do
		expect(test_line).to be_a_kind_of(SubwayLine)
		expect(test_line.name).to eq('1 2 3')
		expect(test_line.status).to eq('Planned Work')
	end

	context 'with a link to details on service changes' do
		it 'allows links to be added later on' do
			test_line.info_link = 'http://assistive.usablenet.com/tt/www.mta.info/status/subway/some_line/some_page'

			expect(test_line.info_link).not_to be_nil
		end
	end

	context 'with array to store all lines' do
		it 'stores instances in class array' do
			expect(SubwayLine.all).not_to be_empty
		end
	end

end