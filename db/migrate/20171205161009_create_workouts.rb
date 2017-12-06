class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string  :name
      t.string  :time
      t.integer :user_id
      t.integer :location_id
      t.integer :calories_burned
      t.integer :duration_mins
      t.integer :rating
      t.text    :notes
      t.integer :playlist_id
    end
  end
end
