class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  belongs_to :playlist

  def self.longest
    self.find_by(duration_mins: (self.maximum("duration_mins"))).description
  end

  def self.highest_rated
    self.find_by(rating: (self.maximum("rating"))).description
  end

  def self.most_cals_burned
    self.find_by(calories_burned: (self.maximum("calories_burned"))).description
  end


end
