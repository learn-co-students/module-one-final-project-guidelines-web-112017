require 'csv'

#marvin /Users/marvinclerge/Development/Projects/module-one-final-project-guidelines-web-112017/db/ww2.csv'
#Listing.create(title: Faker::Name.name)

doc = CSV.read('/Users/marvinclerge/Development/Projects/module-one-final-project-guidelines-web-112017/db/ww2.csv')
#0 weapon, 1 tyoe, 2 country

Weapon.all.each { |x| x.destroy }
Type.all.each { |x| x.destroy }
Country.all.each { |x| x.destroy }

doc[1..-1].each do |x|
  Type.find_or_create_by(name: "#{x[1]}")
  Country.find_or_create_by(name: "#{x[2]}")
  # binding.pry
  Weapon.create(
    name: "#{x[0]}",
    type_id: Type.all.find{|a| a.name == x[1]}.id
  )
# binding.pry
  CountryWeapon.create(
    country_id: Country.all.find{|country| country.name == x[2]}.id,
    weapon_id: Weapon.all.find{|weapon| weapon.name == x[0]}.id
  )
end
