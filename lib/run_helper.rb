def game_start
  puts "Welcome to Presidential Thunderdome!!!"
  get_input
end

def log_in
  input = gets.chomp
  Player.find_or_create_by(name: input)
end

def get_input
  puts "Play / Stats / Quit"
  input = gets.chomp.downcase
  if input == "stats"
    find_stats
    get_input
  elsif input == "play"
    puts "Player 1, please enter your username:"
    player1 = log_in
    puts "Player 2, please enter your username:"
    player2 = log_in
    Challenge.new(player1, player2).start_challenge
    get_input
  elsif input == "quit"
    puts "Bye bye!"
  else
    puts "Invalid input."
    get_input
  end
end

def find_stats
  puts "Lookup / Best / Back"
  input = gets.chomp.downcase
  case input
  when "lookup"
    puts "Which player?"
    player = gets.chomp
    if Player.find_by(name: player)
      my_stats(Player.find_by(name: player))
    else
      puts "Invalid player name."
    end
  when "best"
    top_scoring_player
  when "back"
  else
    puts "Invalid input."
    find_stats(player)
  end
end

def my_stats(player)
  total = player.games.count
  wins = player.games.where(winner_id: player.id).count
  puts "#{player.name} has won #{wins} game(s) out of #{total} game(s)."
  puts "for a #{player.win_pct}% win percentage." if total > 0
end

# def popularity
#
# end

def top_scoring_player
  top_score = 0
  top_player = ""
  Player.all.each do |player|
    if player.win_pct > top_score
      top_player = player.name
      top_score = player.win_pct
    end
  end
  puts "#{top_player} has the highest win percentage at #{top_score}%"
end
