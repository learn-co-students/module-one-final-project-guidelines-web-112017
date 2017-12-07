class Challenge

  attr_reader :player1, :player2
  attr_accessor :picked_prezzies, :game, :squad1, :squad2, :challenges

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @challenges = challenge_list
    @picked_prezzies = []
    @game = Game.create
    @squad1 = Squad.create(player: player1, game: game, points: 0)
    @squad2 = Squad.create(player: player2, game: game, points: 0)
  end

  def start_challenge
    squad_style
    5.times do
      give_challenge
    end
    if self.squad1.points > self.squad2.points
      results(self.player1, self.player2)
    else
      results(self.player2, self.player1)
    end
  end

  def squad_style
    puts "\nChoose Squad / Random Squad"
    input = gets.chomp.downcase
    case input
    when "choose squad"
      pick_squads
    when "random squad"
      random_squad
    else
      puts "Invalid input. Please enter: 'choose squad' or 'random squad'"
      squad_style
    end
  end

  def random_squad
    arr = President.all.sample(10)
    arr1 = arr.slice(0..4)
    arr2 = arr.slice(5..9)
    arr1.each do |prez|
      self.squad1.picks << Pick.create(president: prez)
    end
    arr2.each do |prez|
      self.squad2.picks << Pick.create(president: prez)
    end
  end

  def pick_squads
    num = 5
    5.times do
      make_pick(player1, num, squad1)
      make_pick(player2, num, squad2)
      num -= 1
    end
  end

  def make_pick(player, num, squad)
    display_available
    pick = squad_pick(player, num)
    squad.picks << Pick.create(president: pick)
  end

  def display_available
    puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n\n"
    President.all.each do |president|
      if !picked_prezzies.include?(president)
        puts "#{president.id}. #{president.name}: #{president.description}"
      end
    end
    puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n\n"
  end

  def squad_pick(player, num)
    puts "#{player.name.upcase}: choose a president for your squad by name or number:\n"
    puts "#{num} pick(s) remaining."
    input = gets.chomp
    if input.to_i > 0
      prez = President.find(input)
    else
      prez = President.find_by(name: input)
    end
    if prez
      picked_prezzies << prez
      prez
    else
      puts "Invalid input."
      squad_pick(player)
    end
  end

  def results(winner, loser)
    puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n"
    puts "\n         CONGRATULATIONS #{winner.name.upcase}! YOU WIN!\n"
    puts "\n* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *\n\n"
    self.game.winner_id = winner.id
    self.game.loser_id = loser.id
    game.save
  end

  def give_challenge
    chal = self.challenges.pop
    puts "\nChoose a president to represent you for:"
    puts "\n#{chal[:name]}".colorize(:red)
    winner = fight_helper(chal[:stat])
    self.squad1.update(points: (squad1.points + 1)) if winner == player1
    self.squad2.update(points: (squad2.points + 1)) if winner == player2
  end

  def fight_helper(stat)
    prez1 = pick_prez(player1, squad1)
    prez2 = pick_prez(player2, squad2)
    winner = find_winner(prez1, prez2, stat)
    delete_prez(squad1, prez1)
    delete_prez(squad2, prez2)
    win_player = player1 if winner == prez1
    win_player = player2 if winner == prez2
    puts "\nONE POINT to #{win_player.name.upcase}\n\n"
    puts "Fact about #{winner.name}: #{winner.fact}".colorize(:blue)
    win_player
  end

  def delete_prez(squad, prez)
    pick_arr = squad.picks
    pick_arr.delete(pick_arr.where(president: prez))
  end

  def find_winner(prez1, prez2, stat)
    one_stat = 0
    two_stat = 0
    stat.each {|s| one_stat += prez1.send(s)}
    stat.each {|s| two_stat += prez2.send(s)}
    if one_stat < two_stat
      prez1
    elsif one_stat > two_stat
      prez2
    else
      prez1
    end
  end

  def pick_prez(player, squad)
    puts "\n#{player.name.upcase}, choose a president by name or number:\n\n"
    squad.picks.each_with_index {|pick, index| puts "#{index + 1}. #{pick.president.name} - Best Ranked Skill: #{pick.president.best_stat}" }
    input = gets.chomp
    if input.to_i > 0
      prez = squad.picks[input.to_i - 1]
    else
      if found_pres = President.find_by(name: input)
      prez = squad.picks.find_by(president_id: found_pres.id)
      end
    end
    if prez
      prez.president
    else
      puts "Invalid input."
      pick_prez(player, squad)
    end
  end

end
