describe SubwayLine do

	let(:test_line) { SubwayLine.new('1 2 3', 'Planned Work') }

	it 'initializes with name and status' do
		expect(test_line).to be_a_kind_of(SubwayLine)
		expect(test_line.name).to eq('1 2 3')
		expect(test_line.status).to eq('Planned Work')
	end
	
end