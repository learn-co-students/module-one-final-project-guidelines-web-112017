def list_types
  print "\n"
  Type.all.each do |type|
    puts "#{type.id}. #{type.name}"
  end
  puts "\nPlease pick a type by number."
  nil
end

def list_type_commands(type_input)
  puts "\nEnter number of command for #{Type.find(type_input).name}:
  1.Show all weapons for type
  2.Show all countries
  3. What country has the most of this type?
  4. Which weapon of this type has the lowest caliber?
  5. Which weapon of this type has the lightest weight?
  6. Which weapon of this type has the shortest range?
  "
end

def all_type_weapons(type_input)
  Type.find(type_input).weapons.each do |weapon|
    star_divider
    puts weapon.name
  end

  nil
end

def all_type_countries(type_input)
  a = Type.find(type_input).weapons.map do |weapon|
    weapon.countries[0]
  end.uniq.compact
 star_divider
 a.each{|x| puts x.name}
  nil
end



def most_popular_country_by_type(type_input)
  a=Type.find(type_input).weapons.map do |weapon|
    weapon.countries[0]
  end

  freq = a.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  star_divider
  puts a.max_by { |v| freq[v] }.name
end

def type_lowest_caliber_weapon(type_input)
  hash ={}
  a = Type.find(type_input).weapons.map do |weapon|
    if weapon.caliber
      hash[weapon.name] = weapon.caliber[0..-4].to_f
    end
  end
  a=hash.sort_by {|_key, value| value}.first
    if a == nil
      star_divider
      puts "There is no caliber for this type."
    else
      star_divider
      puts "#{a[0]} with a caliber of #{a[1]} mm"
  end
  nil
end

def type_lightest_weapon(type_input)
  hash ={}
  a = Type.find(type_input).weapons.map do |weapon|
    if weapon.weight
      hash[weapon.name] = weapon.weight[0..-4].to_f
    end
  end
  a=hash.sort_by {|_key, value| value}.first
    if a == nil
      star_divider
      puts "There is no weight for this type."
    else
      star_divider
      puts "#{a[0]} with a weight of #{a[1]} kg"
  end
  nil
end

def type_shortest_range_weapon(type_input)
  hash ={}
  a = Type.find(type_input).weapons.map do |weapon|
    if weapon.range
      hash[weapon.name] = weapon.range[0..-3].to_f
    end
  end
  a=hash.sort_by {|_key, value| value}.first
    if a == nil
      star_divider
      puts "There is no range for this type."
    else
      star_divider
      puts "#{a[0]} with a range of #{a[1]} m"
  end
  nil
  end

def determine_type_command(type_input, type_command_input)
  case type_command_input
    when 1
      all_type_weapons(type_input)
    when 2
      all_type_countries(type_input)
    when 3
      most_popular_country_by_type(type_input)
    when 4
      type_lowest_caliber_weapon(type_input)
    when 5
      type_lightest_weapon(type_input)
    when 6
      type_shortest_range_weapon(type_input)
    end
end
