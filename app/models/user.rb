class User < ActiveRecord::Base
  has_many :reviews
  has_many :residences
  has_many :polling_places, through: :residences

  #A user will be solely responsible for creating reviews
  def create_review(title:, message:, wait_time:, service:)
    new_review = Review.create(title: title, message: message, wait_time: wait_time, service: service, user_id: self.id, polling_place_id: self.find_current_polling_place)
  end
  #A user will be solely responsible for creating residences
  def create_residence(street_number: , street_name: , zip_code: , is_primary:)
    self.maintain_primary_residence
    new_residence = Residence.create(street_number: street_number, street_name: street_name, zip_code: zip_code, is_primary: is_primary, user_id: self.id)
    #class method to find the polling place id. This runs API.
    new_residence.find_polling_place_id
    new_residence

    #save at some point!@#!@#!@#
  end
  #A user can have many residences, but polling_place must be determined by primary only
  def primary_residence
    self.residences.find_by(is_primary: true)
    #binding.pry
  end

  def find_current_polling_place
    self.primary_residence.polling_place_id
    #binding.pry
  end

  def maintain_primary_residence
    Residence.all.where(user_id: self.id).each do |residence|
      residence.is_primary = false
      residence.save
    end
  end

end
