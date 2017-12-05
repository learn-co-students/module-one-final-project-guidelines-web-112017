class Location < ActiveRecord::Base
  has_many :workouts
  has_many :users, through: :workouts
  # has_many :playlists, through: :workouts
end
