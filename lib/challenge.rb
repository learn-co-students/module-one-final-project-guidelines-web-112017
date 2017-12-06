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
    pick_squads
    1.times do
      give_challenge
    end
    if self.squad1.points > self.squad2.points
      results(self.player1, self.player2)
    else
      results(self.player2, self.player1)
    end
  end

  def pick_squads
    1.times do
      display_available
      pick1 = squad_pick(player1)
      self.squad1.picks << Pick.create(president: pick1)
      display_available
      pick2 = squad_pick(player2)
      self.squad2.picks << Pick.create(president: pick2)
    end
  end

  def display_available
    President.all.each do |president|
      if !picked_prezzies.include?(president)
        puts "#{president.name}: #{president.description}"
      end
    end
  end

  def squad_pick(player)
    puts "#{player.name}: choose a president for your squad:"
    prez = President.find_by(name: gets.chomp)
    if prez
      picked_prezzies << prez
      prez
    else
      puts "Invalid input."
      squad_pick(player)
    end
  end

  def results(winner, loser)
    puts "Congratulations #{winner.name}! You win!"
    self.game.winner_id = winner.id
    self.game.loser_id = loser.id
    game.save
  end

  def give_challenge
    chal = self.challenges.pop
    puts "Choose a president to represent you for:"
    puts chal[:name]
    winner = fight_helper(chal[:stat])
    self.squad1.update(points: (squad1.points + 1)) if winner == player1
    self.squad2.update(points: (squad2.points + 1)) if winner == player2
  end

  def fight_helper(stat)
    prez1 = pick_prez(player1)
    prez2 = pick_prez(player2)
    winner = find_winner(prez1, prez2, stat)
    delete_prez(player1, prez1)
    delete_prez(player2, prez2)
    win_player = player1 if winner == prez1
    win_player = player2 if winner == prez2
    puts "One point to #{win_player.name}"
    puts winner.fact
    win_player
  end

  def delete_prez(player, prez)
    pick_arr = player.squads.last.picks
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

  def pick_prez(player)
    puts "#{player.name}, choose a president!"
    player.squads.last.picks.each {|pick| puts pick.president.name}
    prez = player.squads.last.picks.find {|pick| pick.president.name == gets.chomp}
    if prez
      prez.president
    else
      puts "Invalid input."
      pick_prez(player)
    end
  end

end
