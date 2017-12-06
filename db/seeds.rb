require 'csv'
require_relative '../config/environment'

csv = CSV.read('presidents.csv', headers: :first_row)


# t.string :name
# t.string :description
# t.string :fact
# t.integer :rank
# FIRST NAME,LAST NAME,IN OFFICE,ORDER,State,Age elected,NICKNAME,Trivia,Rank

csv.each do |row|
  President.create(name: "#{row[0]} #{row[1]}", description: row[6], fact: row[7], rank: row[8])
end
