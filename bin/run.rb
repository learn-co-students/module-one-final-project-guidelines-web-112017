require_relative '../config/environment'

def list_weapons

end

def list_countries
  Country.all.each_with_index do |country, i|
    if i % 5 == 0
      print "\n\n#{i+1}.#{country.name}   "
    else
      print "#{i+1}.#{country.name}   "
    end
  end
  nil
end

binding.pry

def list_types

end
