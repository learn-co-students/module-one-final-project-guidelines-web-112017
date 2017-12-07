class Playlist < ActiveRecord::Base
  has_many :workouts
  has_many :users, through: :workouts
  has_many :locations, through: :workouts

  def self.most_popular
    hash = Hash.new(0)
    Workout.all.map do |w|
      hash[w.playlist] += 1
    end
    most_popular = hash.max_by{|k,v| v}.first.name
    puts "The most played playlist at our gym is #{most_popular}"
  end

  def self.best_rated
    best_rated = self.find_by(rating: (self.maximum("rating"))).name
    puts "The best rated playlist at our gym is #{best_rated}"
  end

  def self.longest_playlist
    longest_playlist = self.find_by(num_songs: (self.maximum("num_songs"))).name
    puts "The longest playlist at our gym by number of songs is #{longest_playlist}"
  end

  def self.list_playlists
    self.all.map { |pl| puts "#{pl.name}" }
  end

end
