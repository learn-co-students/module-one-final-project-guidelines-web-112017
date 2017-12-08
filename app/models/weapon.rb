class Weapon < ActiveRecord::Base
  belongs_to :type
  has_many :country_weapons
  has_many :countries, through: :country_weapons
end
