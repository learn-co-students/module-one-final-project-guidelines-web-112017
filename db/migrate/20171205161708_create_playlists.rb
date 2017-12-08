class CreatePlaylists < ActiveRecord::Migration[5.1]
  def change
    create_table :playlists do |t|
      t.string  :name
      t.integer :num_songs
      t.string  :genre
      t.integer :rating
    end
  end
end
