require 'csv'
require_relative '../lib/scraper.rb'


#marvin /Users/marvinclerge/Development/Projects/module-one-final-project-guidelines-web-112017/db/ww2.csv'
#matt /Users/mattfaircloth/Development/module-projects/module-one-final-project-guidelines-web-112017/db/ww2.csv

doc = CSV.read('/Users/marvinclerge/Development/Projects/module-one-final-project-guidelines-web-112017/db/ww2.csv')
#0 weapon, 1 tyoe, 2 country

Weapon.all.each { |x| x.destroy }
Type.all.each { |x| x.destroy }
Country.all.each { |x| x.destroy }

doc[1..-1].each do |x|
  Type.find_or_create_by(name: "#{x[1]}".squish)
  Country.find_or_create_by(name: "#{x[2]}".squish)
  Weapon.create(
    name: "#{x[0]}".squish,
    type_id: Type.all.find{|a| a.name == x[1].squish}.id
  )
  CountryWeapon.create(
    country_id: Country.all.find{|country| country.name == x[2].squish}.id,
    weapon_id: Weapon.all.find{|weapon| weapon.name == x[0].squish}.id
  )
end

data.each do |hash|
  Weapon.all.each do |weapon|
    if weapon.name == hash[:text]
      weapon.caliber = hash[:caliber]
      weapon.weight = hash[:weight]
      weapon.range = hash[:range]
    end
  end
end
