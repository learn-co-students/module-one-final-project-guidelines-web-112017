class User < ActiveRecord::Base
  has_many :workouts
  has_many :playlists, through: :workouts
  has_many :locations, through: :workouts

  def add_workout(workout_inst)
    self.workouts << workout_inst
  end

  def find_pool_workouts
    self.workouts.select{ |w| w.location.name == "pool"} #very specific location needed for this to work
  end

  def find_lifting_workouts
    self.workouts.select{ |w| w.location.name == "weights"} #very specific location needed for this to work
  end

  def find_last_workout
    self.workouts.last #make by time and use timestamps
  end

  #def num_workouts_last_week
  #end

  def favorite_playlist
    max_rating = self.playlists.maximum("rating")
    self.playlists.find_by(rating: max_rating).name
  end

end
