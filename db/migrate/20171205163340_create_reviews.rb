class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :message
      t.integer :wait_time
      t.integer :service
      t.integer :user_id
      t.integer :polling_place_id
    end
  end
end
