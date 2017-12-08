class GameRunner

  def initialize
    Drawing.new
    get_input
  end

  def log_in
    Player.find_or_create_by(name: gets.chomp.upcase)
  end

  def get_input
    puts "                   PLAY / STATS / QUIT"
    input = gets.chomp.downcase
    case input
    when "stats"
      find_stats
    when "play"
      puts "\nPrepare for battle! Choose your squad of presidents, then compete against your opponent in five challenges!"
      puts "\nPLAYER 1, please enter your username:\n"
      player1 = log_in
      puts "\nPLAYER 2, please enter your username:\n"
      player2 = log_in
      Challenge.new(player1, player2).start_challenge
    when "quit"
      puts "\nYOU SURVIVED... THIS TIME."
      return
    else
      puts "Invalid input."
    end
    get_input
  end

  def find_stats
    puts "\n\n                  LOOKUP / BEST / BACK"
    input = gets.chomp.downcase
    case input
    when "lookup"
      puts "\nWhich player?"
      player = Player.find_by(name: gets.chomp.upcase)
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
    puts "\n#{player.name} has won #{player.wins} game(s) out of #{player.total_games} game(s)."
    puts "for a #{player.win_pct}% win percentage.\n\n"
  end

  def top_scoring_player
    top_player = Player.all.sort_by {|player| player.win_pct }.last
    puts "\n#{top_player.name} has the highest win percentage at #{top_player.win_pct}%\n\n"
  end

end
