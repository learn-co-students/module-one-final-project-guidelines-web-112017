require 'nokogiri'
require 'open-uri'
require 'pry'

html = open("https://ww2db.com/weapon.php?list=a")


doc = Nokogiri::HTML(html)
links = doc.css(".datatable a[href]")
links_array = links.map {|element| element["href"]}.compact
weapons_data_links = links_array[22..-1]

binding.pry

hello = "hello world"
