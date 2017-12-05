class CreateWeapons < ActiveRecord::Migration[4.2]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :type_id
    end
  end
end
