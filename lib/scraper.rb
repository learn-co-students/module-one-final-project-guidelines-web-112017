require_relative '../config/environment'
require 'nokogiri'
require 'open-uri'


doc = Nokogiri::HTML(open("https://ww2db.com/weapon.php?list=a"))


data = doc.css('tr').css('td').css('a').map do |x|
  {text: x.text, link: x.values[0]}
end[6..-1]


# binding.pry

data.each do |hash| #{:key => value}
  doc = Nokogiri::HTML(open("https://ww2db.com/" + hash[:link]))
  code = doc.css(".table_noborder").css('tr').css('td')
  code.each_with_index do |x,i| #:link, "weapon.php?q=a193"
    if x.text == "Caliber"
      puts "Getting caliber for #{hash[:text]}"
      hash[:caliber] = code[i+1].text
      break
    end
  end
end



  data.each do |hash| #:link, "weapon.php?q=a193"
    doc = Nokogiri::HTML(open("https://ww2db.com/" + hash[:link]))
    code = doc.css(".table_noborder").css('tr').css('td')
    code.each_with_index do |x,i|
      if x.text == "Weight"
        # binding.pry
        puts "Getting weight for #{hash[:text]}"
        hash[:weight] = code[i+1].text
        break
      end
    end
  end



  data.each do |hash| #:link, "weapon.php?q=a193"
    doc = Nokogiri::HTML(open("https://ww2db.com/" + hash[:link]))
    code = doc.css(".table_noborder").css('tr').css('td')
    code.each_with_index do |x,i|
      if x.text == "Range"
        puts "Getting range for #{hash[:text]}"
        hash[:range] = code[i+1].text
        break
      end
    end
  end



# data[0][:caliber]
# data[0][:range]
# data[0][:weight]
