class Game < ActiveRecord::Base
  has_many :squads
  has_many :players, through: :squads
end
