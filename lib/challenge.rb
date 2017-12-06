class Challenge

  attr_reader :challenges, :player1, :player2
  attr_accessor :picked_prezzies, :player1_points, :player2_points, :game, :squad1, :squad2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @challenges = [
      {name: "Sell Girl Scout Cookies", stat: ["charisma"]},
      {name: "Eat McDonalds Sandwiches", stat: ["fortitude"]},
      {name: "Win a Drag Race", stat: ["speed"]},
      {name: "Settle a Disagreement", stat: ["empathy", "charisma"]},
      {name: "Housesit for You", stat: ["empathy"]},
      {name: "Win a Boxing Match", stat: ["strength"]},
      {name: "Paint Your Portait", stat: ["creativity"]}
    ]

    @picked_prezzies = []
    @player1_points = 0
    @player2_points = 0
    @game = Game.create
    @squad1 = Squad.create
    @squad2 = Squad.create
    puts "Welcome to the Presidential Thunderdome!"
  end

  def start_challenge
    pick_squads
    1.times do
      give_challenge
    end
    if self.player1_points > self.player2_points
      puts "Congratulations #{player1.name}! You win!"
      self.game.winner_id = self.player1.id
      self.game.loser_id = self.player2.id
      game.save
    else
      puts "Congratulations #{player2.name}! You win!"
      self.game.winner_id = self.player2.id
      self.game.loser_id = self.player1.id
      game.save
    end
  end

  def give_challenge
    challenges.shuffle
    chal = challenges.pop
    # challenges.delete(chal)
    puts "Choose a president to represent you for:"
    puts chal[:name]
    winner = fight_helper(chal[:stat])
    self.player1_points += 1 if winner == player1
    self.player2_points += 1 if winner == player2
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
    puts player.squads.last.picks.each {|pick| puts pick.president.name}
    input = STDIN.gets.chomp
    prez = player.squads.last.picks.find {|pick| pick.president.name == input}
    if prez
      prez.president
    else
      puts "Invalid input."
      pick_prez(player)
    end
  end

  def pick_squads
    player1.squads << squad1
    player2.squads << squad2
    game.squads << squad1
    game.squads << squad2
    pick_alternator(squad1, squad2)
  end

  def pick_alternator(squad1, squad2)
    1.times do
      display_available
      pick1 = squad_pick(player1)
      squad1.picks << Pick.create(president: pick1)
      display_available
      pick2 = squad_pick(player2)
      squad2.picks << Pick.create(president: pick2)
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
    puts "#{player.name}: choose a president for your squad (spelling counts):"
    input = gets.chomp
    prez = President.find_by(name: input)
    picked_prezzies << prez
    prez
  end

end
