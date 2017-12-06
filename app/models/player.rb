class Player < ActiveRecord::Base
  has_many :squads
  has_many :games, through: :squads
  has_many :picks, through: :squads

  def win_pct
    total = self.games.count
    wins = self.games.where(winner_id: self.id).count
    if total > 0
      pct = wins * 100 / total
    else
      0
    end
  end
end
