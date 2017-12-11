class CreatePresidents < ActiveRecord::Migration
  def change
    create_table :presidents do |t|
      t.string :name
      t.string :description
      t.string :fact
      t.integer :strength
      t.integer :dexterity
      t.integer :stamina
      t.integer :wisdom
      t.integer :intelligence
      t.integer :charisma
    end
  end
end
