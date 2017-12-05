class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :president_id
      t.integer :squad_id
    end
  end
end
