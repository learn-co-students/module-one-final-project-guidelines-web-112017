class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.integer :game_id
      t.integer :player_id
    end
  end
end
