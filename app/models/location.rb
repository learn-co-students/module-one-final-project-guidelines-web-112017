class Location < ActiveRecord::Base
  has_many :workouts
  has_many :users, through: :workouts
  has_many :playlists, through: :workouts

  def self.list_all_facilities
    self.all.map { |facility| puts facility.name  }
  end

  def self.find_clean
    self.all.select do |location|
      location.cleanliness >= 7
    end.map { |clean| puts clean.name  }
  end

  def self.find_dirty
    self.all.select do |location|
      location.cleanliness < 7
    end.map { |dirty| puts dirty.name  }
  end

  def self.find_empty
    self.all.select do |location|
      location.empty?
    end.map { |empty| puts empty.name  }
  end

  def self.find_crowded
    self.all.select do |location|
      !location.empty?
    end.map { |crowded| puts crowded.name  }
  end

end
