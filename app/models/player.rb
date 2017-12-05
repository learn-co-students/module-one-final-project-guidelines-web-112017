class Player < ActiveRecord::Base
  has_many :squads
  has_many :games, through: :squads
end
