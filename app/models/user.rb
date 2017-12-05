class User < ActiveRecord::Base
  has_many :workouts
  has_many :playlists, through: :workouts
  has_many :locations, through: :workouts
end
 
