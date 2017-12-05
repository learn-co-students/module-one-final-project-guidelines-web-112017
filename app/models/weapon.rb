class Weapon < ActiveRecord::Base
  belongs_to :type
  has_many :countries, through: :countryweapons
end
