class Country < ActiveRecord::Base
  has_many :country_weapons
  has_many :weapons, through: :country_weapons
end
