class CreateCountryWeapons < ActiveRecord::Migration[4.2]
  def change
    create_table :countryweapons do |t|
      t.integer :country_id
      t.integer :weapon_id
    end
  end
end
