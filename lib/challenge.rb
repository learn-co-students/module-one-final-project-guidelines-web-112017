class Challenge

  attr_reader :challenges, :player1, :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @challenges = [{name: "Lead A War", stat: "rank"}, {name: "Lead A War", stat: "rank"}, {name: "Lead A War", stat: "rank"}, {name: "Lead A War", stat: "rank"}, {name: "Lead A War", stat: "rank"}]

      #{}"Give A Speech", "Sell Girl Scout Cookies", "Make Lemonade", "Settle An Argument", "Win A Fist Fight", "Win A Hot Dog Eating Contest", "Win A Footrace", "Fix The Economy", "Win A Round Of Golf"]
    puts "Welcome to the Presidential Thunderdome!"
  end

  def give_challenge
    chal = challenges.pop
    # challenges.delete(chal)
    puts "Choose a president to represent you for:"
    puts chal[:name]
    fight_helper(chal[:stat])
  end

  def fight_helper(stat)
    prez1 = pick_prez(player1)
    prez2 = pick_prez(player2)
    winner = find_winner(prez1, prez2, stat)
    delete_prez(player1, prez1)
    delete_prez(player2, prez2)
    #add point to winner
    puts "One point to #{winner.name}"
      puts "James Polk did stuff"#fact about winning prez
  end

  def delete_prez(player, prez)
    pick_arr = player.squads.last.picks
    pick_arr.delete(pick_arr.where(president: prez))
  end

  def find_winner(prez1, prez2, stat)
    if prez1.send(stat) < prez2.send(stat)
      player1
    else
      player2
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

  def start_challenge
    5.times do
      give_challenge
    end
    compare squad points
    puts winner
    assign winner_id and loser id
  end

end
