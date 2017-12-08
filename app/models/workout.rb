class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  belongs_to :playlist

  def self.avg_workout_length
    avg = self.average(:duration_mins)
    puts "The average workout length at our gym is #{avg.to_i} mins"
  end

  def self.avg_workout_rating
    avg = self.average(:rating)
    puts "The average workout rating between 1 and 10 at our gym is #{avg.to_i}"
  end

  def self.avg_calories_burned
    avg = self.average(:calories_burned)
    puts "The average number of calories burned during a workout at our gym is #{avg.to_i}"
  end

end
