class PollingPlace < ActiveRecord::Base
  has_many :reviews
  has_many :residences
  has_many :users, through: :residences


  def self.find_polling_place_by_council_district(council_district)
    self.all.find_by(council_district: council_district)
  end
  #These will be created by seeding database with api information.

  def average_wait_time
    self.reviews.average(:wait_time).to_i
  end

  def average_service_rating
    self.reviews.average(:service).to_f.round(1)
  end
end
