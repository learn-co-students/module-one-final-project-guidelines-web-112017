def welcome(name)
  puts "Welcome #{name}"
  puts "Enter command"
end

def list_countries
  Country.all.each{|country| puts "#{country.id}. #{country.name}"}
end

def list_weapons
  Weapon.all.each{|weapon| puts "#{weapon.id}. #{weapon.name}"}
  gets
  start method
end


scraping
  caliber
  weight
  range


home #has functions and gets input
options
weapons
  most popular weapon/country/type
  least popular weapon/country/type
  total weapon/country/type

countries
  most popular weapon/country/type
  least popular weapon/country/type
  total weapon/country/type

type
  most popular weapon/country/type
  least popular weapon/country/type
  total weapon/country/type
