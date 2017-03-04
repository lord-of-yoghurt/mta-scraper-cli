describe SubwayLine do

  let(:test_line) { ServiceScraper.parse_info('./fixtures/example_page.htm')[1] }
  let(:test_obj) { SubwayLine.new(test_line) }

  it 'initializes with name and status' do
    expect(test_obj).to be_a_kind_of(SubwayLine)
    expect(test_obj.name).to eq('4 5 6')
    expect(test_obj.status).to eq('Planned Work')
  end

  context 'with a link to details on service changes' do
    it 'allows links to be added later on' do
      test_obj.info_link = 'http://assistive.usablenet.com/tt/www.mta.info/status/subway/some_line/some_page'

      expect(test_obj.info_link).not_to be_nil
    end
  end

  context 'with array to store all lines' do
    it 'stores instances in class array' do
      expect(SubwayLine.all).not_to be_empty
    end
  end

  describe '#find_by_name' do
    it 'returns a SubwayLine object for further use' do
      line = SubwayLine.find_by_name('4 5 6')

      expect(line.status).to eq('Planned Work')
    end
  end

end