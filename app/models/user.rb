class User < ActiveRecord::Base
  has_many :workouts
  has_many :playlists, through: :workouts
  has_many :locations, through: :workouts

  def find_workouts_by_facility(loc_id)
    fac_names = self.workouts.select{ |w| w.location.id == loc_id }.map do |wo|
      wo.name
    end
    puts fac_names
  end

  def find_workouts_by_time_of_day(time_of_day)
    tod_workouts = self.workouts.select { |w| w.time == time_of_day }.map do |wo|
      wo.name
    end
    puts tod_workouts
  end

  def most_played_playlist
    hash = Hash.new(0)
    self.workouts.map do |w|
      hash[w.playlist] += 1
    end
    puts hash.max_by{|k,v| v}.first.name
  end

  def highest_rated_playlist
    max_rating = self.playlists.maximum("rating")
    puts self.playlists.find_by(rating: max_rating).name
  end

  def list_workouts_by_name
    self.workouts.map { |wo| puts " Name: #{wo.name} \n Rating: #{wo.rating} \n Length: #{wo.duration_mins} mins \n Cals Burned: #{wo.calories_burned} cals \n Playlist: #{wo.playlist.name}"  }
  end

  def max_cals_burned
    puts self.workouts.find_by(calories_burned: (self.workouts.maximum("calories_burned"))).name
  end

  def highest_rated_workout
    puts self.workouts.find_by(rating: (self.workouts.maximum("rating"))).name
  end

  def longest_workout
    puts self.workouts.find_by(duration_mins: (self.workouts.maximum("duration_mins"))).name
  end

  def self.avg_age
    avg = self.average(:age)
    puts "The average age for our gym members is #{avg}"
  end

end
