class Playlist < ActiveRecord::Base
  has_many :workouts
  has_many :users, through: :workouts
  # has_many :locations, through: workouts:
end
