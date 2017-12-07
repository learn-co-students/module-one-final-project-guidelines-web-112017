require 'pry'

class User < ActiveRecord::Base
  has_many :workouts
  has_many :playlists, through: :workouts
  has_many :locations, through: :workouts

  def find_workouts_by_facility(loc_id)
    fac_names = self.workouts.select{ |w| w.location.id == loc_id }.map do |wo|
      wo.name
    end
    fac_names
  end

  def find_workouts_by_time_of_day(time_of_day)
    tod_workouts = self.workouts.select { |w| w.time == time_of_day }.map do |wo|
      wo.name
    end
     tod_workouts
  end

  def most_played_playlist
    hash = Hash.new(0)
    self.workouts.map do |w|
      hash[w.playlist] += 1
    end
    name =  hash.max_by{|k,v| v}.first.name
    play_count = hash.max_by{|k,v| v}[1]
    puts "YOUR MOST PLAYED PLAYLIST: \n #{name} \n Playcount: #{play_count}"
  end

  def highest_rated_playlist
    max_rating = self.playlists.maximum("rating")
    playlist =  self.playlists.find_by(rating: max_rating).name
    puts "YOUR HIGHEST RATED PLAYLIST: \n #{playlist} \n Rating: #{max_rating}"
  end

  def list_workouts_by_name
    self.workouts.map { |wo| puts " Name: #{wo.name} \n Time of Day: #{wo.time} \n Rating: #{wo.rating} \n Length: #{wo.duration_mins} mins \n Cals Burned: #{wo.calories_burned} cals \n Playlist: #{wo.playlist.name} \n Notes: #{wo.notes} \n *************************"  }
  end

  def max_cals_burned
    workout = self.workouts.find_by(calories_burned: (self.workouts.maximum("calories_burned"))).name
    cals_burned = self.workouts.maximum("calories_burned")
    puts "Workout Name: #{workout} \n Cals burned: #{cals_burned}"
  end

  def highest_rated_workout
    workout = self.workouts.find_by(rating: (self.workouts.maximum("rating"))).name
    rating = self.workouts.maximum("rating")
    puts "Workout Name: #{workout} \n Rating: #{rating}"
  end

  def longest_workout
    workout = self.workouts.find_by(duration_mins: (self.workouts.maximum("duration_mins"))).name
    minutes = self.workouts.maximum("duration_mins")
    puts "Workout Name: #{workout} \n Minutes: #{minutes}"
  end

  def self.avg_age
    avg = self.average(:age)
    puts "The average age for our gym members is #{avg.to_i}"
  end

end
