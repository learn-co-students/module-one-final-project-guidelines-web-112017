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
