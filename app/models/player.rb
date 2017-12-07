class Player < ActiveRecord::Base
  has_many :squads
  has_many :games, through: :squads
  has_many :picks, through: :squads

  def win_pct
    if self.total_games > 0
      pct = self.wins * 100 / self.total_games
    else
      0
    end
  end

  def total_games
    self.games.count
  end

  def wins
    self.games.where(winner_id: self.id).count
  end
end
