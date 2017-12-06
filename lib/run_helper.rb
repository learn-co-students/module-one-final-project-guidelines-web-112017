def game_start
  puts "Player 1, please enter your username:"
  player1 = log_in
  get_input(player1)
end

def log_in
  input = gets.chomp
  Player.find_or_create_by(name: input)
end

def get_input(player1)
  puts "check stats? or play? quit?"
  input = gets.chomp.downcase
  if input == "stats"
    puts find_stats(player1)
    get_input(player1)
  elsif input == "play"
    puts "Player 2, please enter your username:"
    player2 = log_in
    Challenge.new(player1, player2).start_challenge
    get_input(player1)
  elsif input == "quit"
    puts "Bye bye!"
  else
    puts "Invalid input."
    get_input(player1)
  end
end

def find_stats(player)
  total = player.games.count
  wins = player.games.where(winner_id: player.id).count
  pct = wins/total * 100 if total > 0
  puts "You've won #{wins} game(s) out of #{total} game(s)."
  puts "for a #{pct}% win percentage." if total > 0
  puts "delete history? Y/N"
  input = gets.chomp.downcase
  player.squads.destroy_all if input == "y"
end
