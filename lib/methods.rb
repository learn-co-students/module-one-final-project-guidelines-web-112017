require_relative '../config/environment'

def welcome
  puts "Welcome to World War II Weapons Finder"
  puts "What would you like to search by:
  1.Countries
  2.Weapons
  3.Types
  "
end
#______________COUNTRIES_______________
def list_countries
  Country.all.each do |country|
    puts "#{country.id}. #{country.name}"
  end
  nil
end

def list_country_commands(country_input)
  puts "Enter number of command for #{Country.find(country_input).name}:
  1.Show all weapons
  2.Show all types
  3.Show most popular type
  4.Show weapon with highest caliber
  5.Show heaviest weapon
  6.Show weapon with longest range
  "
end

def all_country_weapons(country_input)
  Country.find(country_input).weapons.each do |weapon|
    puts weapon.name
  end

  nil
end

def all_country_types(country_input)
  a=Country.find(country_input).weapons.map do |weapon|
    weapon.type.name
  end.uniq
  puts a

  nil
end

def most_popular_type_by_country(country_input)
  a=Country.find(country_input).weapons.map do |weapon|
    weapon.type
  end

  freq = a.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  a.max_by { |v| freq[v] }.name
end

def country_highest_caliber_weapon(country_input)
  hash ={}
  Country.find(country_input).weapons.map do |weapon|
    if weapon.caliber
      hash[weapon.name] = weapon.caliber[0..-4].to_f
    end
  end

  a=hash.sort_by {|_key, value| value}.last
  puts "#{a[0]} with a caliber of #{a[1]} mm"
  nil
end

def country_heaviest_weapon(country_input)
  hash ={}
  Country.find(country_input).weapons.map do |weapon|
    if weapon.weight
      hash[weapon.name] = weapon.weight[0..-4].to_f
    end
  end

  a=hash.sort_by {|_key, value| value}.last
  puts "#{a[0]} with a weight of #{a[1]} kg"
  nil
end

def country_longest_range_weapon(country_input)
  hash ={}
  Country.find(country_input).weapons.map do |weapon|
    if weapon.range
      hash[weapon.name] = weapon.range[0..-3].to_f
    end
  end

  a=hash.sort_by {|_key, value| value}.last
  puts "#{a[0]} with a range of #{a[1]} m"
  nil
end


def determine_country_command(country_input, country_command_input)
  case country_command_input
    when 1
      all_country_weapons(country_input)
    when 2
      all_country_types(country_input)
    when 3
      most_popular_type_by_country(country_input)
    when 4
      country_highest_caliber_weapon(country_input)
    when 5
      country_heaviest_weapon(country_input)
    when 6
      country_longest_range_weapon(country_input)
  end
end

#______________WEAPONS_______________
def list_weapons
  Weapon.all.each do |weapon|
    puts "#{weapon.id}. #{weapon.name}"
  end
  nil
end

def list_weapon_commands(weapon_input)
  puts "Enter number of command for #{Weapon.find(weapon_input).name}:
  1.Show all countries
  2.Show type of weapon
  3.Show characteristics of #{Weapon.find(weapon_input).name}
  "
end

def all_weapon_countries(weapon_input)
  Weapon.find(weapon_input).countries.each do |country|
    puts country.name
  end

  nil
end

def all_weapon_type(weapon_input)
  puts Weapon.find(weapon_input).type.name
  nil
end

def display_characteristics(weapon_input)
  puts "#{Weapon.find(weapon_input).name}:"
  Weapon.find(weapon_input).range ? (puts "Range is #{Weapon.find(weapon_input).range}") : (puts "Range is unknown")
  Weapon.find(weapon_input).caliber ? (puts "Caliber is #{Weapon.find(weapon_input).caliber}") : (puts "Caliber is unknown")
  Weapon.find(weapon_input).weight ? (puts "Weight is #{Weapon.find(weapon_input).weight}") : (puts "Weight is unknown")
end

def determine_weapon_command(weapon_input, weapon_command_input)
  case weapon_command_input
    when 1
      all_weapon_countries(weapon_input)
    when 2
      all_weapon_type(weapon_input)
    when 3
      display_characteristics(weapon_input)
  end
end

#______________TYPES_______________
def list_types
  Type.all.each do |type|
    puts "#{type.id}. #{type.name}"
  end
  nil
end

def list_type_commands
  puts "Enter number of command:
  1.Show all weapons
  2.Show all countries
  3.Country with most of that type
  4.Show weapon of this type has lowest caliber
  5.Show weapon of this type has lowest range
  6.Show weapon of this type has lowest weight
  "
end
#______________GENERAL_______________
def get_input(max)
  loop do
    input = gets.chomp
    input = input.to_i if input.to_i > 0
    if input.class != Fixnum || input > max || input < 0
      puts "Invalid number"
    else
      return input
    end
  end
end

def run
  welcome
  choice = get_input(3)
  case choice
    when 1
      list_countries
      country_input = get_input(20)
      list_country_commands(country_input)
      country_command_input = get_input(6)
      determine_country_command(country_input, country_command_input)
    when 2
      list_weapons
      weapon_input = get_input(368)
      list_weapon_commands(weapon_input)
      weapon_command_input = get_input(3)
      determine_weapon_command(weapon_input, weapon_command_input)

    when 3
      list_types
      type_input = get_input(22)
      list_type_commands(type_input)
      type_command_input = get_input(6)
      determine_type_command(type_input, type_command_input)
  end
end
binding.pry


# scraping
#   caliber
#   weight
#   range
#
#
# home #has functions and gets input
# options
# weapons
#   most popular weapon/country/type
#   least popular weapon/country/type
#   total weapon/country/type
#
# countries
#   most popular weapon/country/type
#   least popular weapon/country/type
#   total weapon/country/type
#
# type
#   most popular weapon/country/type
#   least popular weapon/country/type
#   total weapon/country/type
