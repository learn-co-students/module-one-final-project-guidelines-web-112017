class CreateResidences < ActiveRecord::Migration[5.1]
  def change
    create_table :residences do |t|
      t.integer :street_number
      t.string :street_name
      t.integer :zip_code
      t.boolean :is_primary
      t.integer :user_id
      t.integer :polling_place_id
    end
  end
end
