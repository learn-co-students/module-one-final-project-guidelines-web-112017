class Country < ActiveRecord::Base
  has_many :weapons, through: :countryweapons
end
