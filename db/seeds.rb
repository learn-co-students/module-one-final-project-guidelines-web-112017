# adam = User.create(name: "Adam", age: 27, fitness: 8)
# ali = User.create(name: "Ali", age: 23, fitness:7)

# adam_workout = Workout.create(time: Time.new, user_id: 1, location_id: 1, calories_burned: 300, duration_mins: 20, rating: 8, description: "I swam in the pool and nobody was there.", playlist_id: 1)
# ali_workout = Workout.create(time: Time.new, user_id: 2, location_id: 2, calories_burned: 100, duration_mins: 15, rating: 6, description: "Gettin BIG", playlist_id: 2)

#playlists
Playlist.create(name: "Pump Up", num_songs: 23, genre: "Pop", rating: 3)
Playlist.create(name: "Workout Rap", num_songs: 36, genre: "Rap", rating: 4)
Playlist.create(name: "Beast Mode", num_songs: 45, genre: "Electronic", rating: 9)
Playlist.create(name: "Rock Me Up", num_songs: 27, genre: "Rock", rating: 10)
Playlist.create(name: "HIIT Pop", num_songs: 18, genre: "Pop", rating: 2)
Playlist.create(name: "Electro Workout", num_songs: 54, genre: "Electronic", rating: 4)


Location.create(name: "Pool", cleanliness: 1, empty?: true)
Location.create(name: "Cardio Room", cleanliness: 7, empty?: false)
Location.create(name: "Weight Room", cleanliness: 5, empty?: true)
Location.create(name: "Yoga Studio", cleanliness: 2, empty?: false)
Location.create(name: "Basketball Court", cleanliness: 9, empty?: true)
Location.create(name: "Rock Climbing Wall", cleanliness: 6, empty?: false)
