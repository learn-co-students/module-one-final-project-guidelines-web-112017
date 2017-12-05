class CountryWeapon < ActiveRecord::Base
  belongs_to :country
  belongs_to :weapon
end
