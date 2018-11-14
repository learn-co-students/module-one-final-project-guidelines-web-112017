class CreatePollingPlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :polling_places do |t|
      t.string :name
      t.string :address
      t.integer :council_district
    end
  end
end
