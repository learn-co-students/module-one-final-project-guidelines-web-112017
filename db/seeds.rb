require 'csv'
require_relative '../config/environment'

csv = CSV.read('presidents_with_rankings2.csv', headers: :first_row)


# t.string :name
# t.string :description
# t.string :fact
# t.integer :rank
# FIRST NAME,LAST NAME,IN OFFICE,ORDER,State,Age elected,NICKNAME,Trivia,Rank

csv.each do |row|
  President.create(name: "#{row[0]} #{row[1]}", description: row[6], fact: row[7], strength: row[9], dexterity: row[10], stamina: row[11], wisdom: row[12], intelligence: row[13], charisma: row[14])
end
