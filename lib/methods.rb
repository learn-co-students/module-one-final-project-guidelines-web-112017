require_relative '../config/environment'

def welcome
  star_divider
  puts "\nWelcome to World War II Weapons Finder!!!"
  puts "\nWhat would you like to search by:
  1. Countries
  2. Weapons
  3. Types
  4. Exit the Program
  "
  puts "Please select an option."
end

def star_divider
  puts "*" * 75
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
  loop do
    welcome
    print "Option Number: "
    choice = get_input(4)
    #if  choice == input
    case choice
      when 1
        list_countries
        print "Country Number: "
        country_input = get_input(20)
        list_country_commands(country_input)
        print "Command Number: "
        country_command_input = get_input(6)
        determine_country_command(country_input, country_command_input)
      when 2
        list_weapons
        print "Weapon Number: "
        weapon_input = get_input(368)
        list_weapon_commands(weapon_input)
        print "Command Number: "
        weapon_command_input = get_input(3)
        determine_weapon_command(weapon_input, weapon_command_input)

      when 3
        list_types
        print "Type Number: "
        type_input = get_input(22)
        list_type_commands(type_input)
        print "Command Number: "
        type_command_input = get_input(6)
        determine_type_command(type_input, type_command_input)
      when 4
        abort("\nThank you for learning about WWII Weapons!")
    end
  end
end
