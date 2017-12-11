class Squad < ActiveRecord::Base
  has_many :picks
  belongs_to :game
  belongs_to :player
end
