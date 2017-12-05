class Playlist < ActiveRecord::Base
  has_many :workouts
  has_many :users, through: :workouts
  has_many :locations, through: :workouts

  def self.most_played
    hash = Hash.new(0)
    Workout.all.map do |w|
      hash[w.playlist] += 1
    end
    hash.max_by{|k,v| v}.first.name 
  end

  def self.best_rated
    self.find_by(rating: (self.maximum("rating"))).name
  end

  def self.longest_playlist
    self.find_by(num_songs: (self.maximum("num_songs"))).name
  end

  def self.genre_count(genre)
    self.where(genre: genre).length
  end
end
