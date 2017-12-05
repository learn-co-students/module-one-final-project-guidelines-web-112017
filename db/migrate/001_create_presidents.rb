class CreatePresidents < ActiveRecord::Migration
  def change
    create_table :presidents do |t|
      t.string :name
      t.string :description
      t.string :fact
      t.integer :rank
    end
  end
end
