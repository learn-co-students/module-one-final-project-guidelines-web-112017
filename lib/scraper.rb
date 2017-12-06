require_relative '../config/environment'
require 'nokogiri'
require 'open-uri'

doc2 = Nokogiri::HTML(open("https://ww2db.com/weapon.php?list=a"))

data = doc2.css('tr').css('td').css('a').map do |x|
  {name: x.text, link: x.values[0]}
end[6..-1]


data.each do |hash| #{:key => value}
  doc2 = Nokogiri::HTML(open("https://ww2db.com/" + hash[:link]))
  code = doc2.css(".table_noborder").css('tr').css('td')
  code.each_with_index do |x,i| #:link, "weapon.php?q=a193"
    if x.text == "Caliber"
      puts "Getting values for #{hash[:name]}"
      hash[:caliber] = code[i+1].text
    end

    if x.text == "Weight"
      hash[:weight] = code[i+1].text
    end

    if x.text == "Range"
      hash[:range] = code[i+1].text
      sleep 3
    end
  end
end
