class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :polling_place

end
