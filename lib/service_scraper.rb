class ServiceScraper

  URL = 'http://assistive.usablenet.com/tt/www.mta.info/?un_jtt_v_status=subwayTab'

  def self.get_page(url=URL)
    Nokogiri::HTML(open(url))
  end

  def self.get_subway_data(url=URL)
    data = self.get_page(url)
    data.css('ul')[1].css('li')
  end

  def self.parse_info(url=URL)
    lines = self.get_subway_data(url)
    collection = []

    lines.each do |line|
      line_hash = Hash.new
      line_hash[:name] = line.text.gsub(/ Subway.+/, '').strip
      line_hash[:status] = line.css('strong').text

      if !line.css('strong a').empty?
        line_hash[:info_link] = 'http://assistive.usablenet.com' + 
          line.css('strong a').attribute('href').value
      end

      if line.text.include?('Staten')
        line_hash[:name] = 'SIR'
      end

      collection << line_hash
    end

    collection
  end

  def self.get_details(info_link)
    Nokogiri::HTML(open(info_link)).css('#status_display').text
  end

end