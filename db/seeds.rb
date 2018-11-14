u1 = User.create(first_name: "Eric", last_name: "Lum")
u2 = User.create(first_name: "Shahin", last_name: "Motia")
u3 = User.create(first_name: "Joey", last_name: "Joejoe-Shabadoo")

# pp1 = PollingPlace.create(name: "PS1", address: "22-25 Jackson Ave, Long Island City, NY 11101")
# pp2 = PollingPlace.create(name: "Stuy High", address: "345 Chambers St, New York, NY 10282" , council_district: 50041)
pp6666 = PollingPlace.create(name: "Sorry... you have nowhere to vote at this time.", address: "See you in hell.")

# c = CSV.read("/Users/smotia/Development/code/module-one-final-project-guidelines-web-112017/db/voting_poll_sites.csv" :headers=>true)
CSV.foreach("db/voting_poll_sites.csv", headers: true) do |row|
  polling_place_hash = {}
  polling_place_hash[:name] = row[2]
  polling_place_hash[:address] = "#{row[3]} #{row[4]} #{row[6]}"
  polling_place_hash[:council_district] = row[14]
  PollingPlace.create!(polling_place_hash)
end

res1 = u1.create_residence(street_number:169, street_name:"Bayard St", zip_code: 11222 ,is_primary:  false)
res2 = u1.create_residence(street_number:94, street_name:"Bayard St", zip_code: 11222 ,is_primary:  false)
res3 = u1.create_residence(street_number:218, street_name:"Beach 98th St.", zip_code: 11694 ,is_primary:  true)

# rv1 = u1.create_review(title: 'werst spot', message: "hot dang, don't vote here", wait_time: 120, service: 5)
