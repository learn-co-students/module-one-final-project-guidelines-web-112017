class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string  :name
      t.integer :cleanliness
      t.boolean :empty?
    end
  end
end
