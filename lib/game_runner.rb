class GameRunner

  def initialize
    puts "Welcome to Presidential Thunderdome!!!"
    get_input
  end

  def log_in
    Player.find_or_create_by(name: gets.chomp)
  end

  def get_input
    puts "Play / Stats / Quit"
    input = gets.chomp.downcase
    case input
    when "stats"
      find_stats
    when "play"
      puts "Prepare for battle! Choose your squad of presidents, then compete against your opponent in five challenges!"
      puts "Player 1, please enter your username:"
      player1 = log_in
      puts "Player 2, please enter your username:"
      player2 = log_in
      Challenge.new(player1, player2).start_challenge
    when "quit"
      puts "Come on back now, y'hear?"
      return
    else
      puts "Invalid input."
    end
    get_input
  end

  def find_stats
    puts "Lookup / Best / Back"
    input = gets.chomp.downcase
    case input
    when "lookup"
      puts "Which player?"
      player = Player.find_by(name: gets.chomp)
      if player
        my_stats(player)
      else
        puts "Invalid player name."
      end
    when "best"
      top_scoring_player
    when "back"
    else
      puts "Invalid input."
      find_stats
    end
  end

  def my_stats(player)
    puts "#{player.name} has won #{player.wins} game(s) out of #{player.total_games} game(s)."
    puts "for a #{player.win_pct}% win percentage."
  end

  def top_scoring_player
    top_player = Player.all.sort_by {|player| player.win_pct }.last
    puts "#{top_player.name} has the highest win percentage at #{top_player.win_pct}%"
  end

end
