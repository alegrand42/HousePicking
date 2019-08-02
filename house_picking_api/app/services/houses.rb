class Houses

require 'open-uri'
require 'nokogiri'
require 'json'

    def self.gather_data
        url = 'https://www.morissimmobilier.com/recherche-immobiliere-avancee/?advanced_city=&surface-min=0&nb-chambres-min=0&budget-max=5000000'
        html = open(url)
        doc = Nokogiri::HTML(html)
        all_houses = []
        count = 0
        doc.css('#listing_ajax_container').each do |house|
            house.css('h4').each do |h|
                url = h.css('a')[0].attributes['href'].value
                if url && !url.empty?
                    disp = (url.include? 'a-vendre') ? 'a vendre' : 'vendu'
                    sp = url.split('-')
                    size = sp.select{|s| s.include? 'm2'}.first
                    name = h.css('a').text.gsub("\n", "").strip
                    House.find_or_create_by(
                        url: url,
                        disponibility: disp,
                        room: url.split('-piece')[0].split('-').last,
                        agency: url[/www.(.*?).com/m, 1],
                        size: size,
                        name: name
                    )
                    count += 1
                end
            end
        end
        count
    end

    def self.get_house_data(params)
      House.find(params['id'])
    end

    def self.get_all_houses_data
      House.all.to_a
    end
end
