require_relative '../config/environment'

def welcome
  puts "Welcome to World War II Weapons Finder"
  puts "What would you like to search by:
  1.Countries
  2.Weapons
  3.Types
  "
end

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
