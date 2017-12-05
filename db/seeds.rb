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

game = Game.create

david = Player.create(name: "David")
kelly = Player.create(name: "Kelly")

d_squad = Squad.create(game_id: 1, player_id: 1)
k_squad = Squad.create(game_id: 1, player_id: 2)

pick1 = Pick.create(president_id: 1, squad_id: 1)
pick2 = Pick.create(president_id: 2, squad_id: 1)
pick3 = Pick.create(president_id: 3, squad_id: 1)
pick4 = Pick.create(president_id: 4, squad_id: 1)
pick5 = Pick.create(president_id: 5, squad_id: 1)
pick6 = Pick.create(president_id: 6, squad_id: 2)
pick7 = Pick.create(president_id: 7, squad_id: 2)
pick8 = Pick.create(president_id: 8, squad_id: 2)
pick9 = Pick.create(president_id: 9, squad_id: 2)
pick10 = Pick.create(president_id: 10, squad_id: 2)
