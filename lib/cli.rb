require 'pry'

#refactor everything in this file?
class Cli
  @current_user = nil
  def self.greeting
    puts "Welcome to your workout log!"
  end

  def self.user_login
    login_id = nil
    login_name = nil #make so you can only pick 1 or 2, also if not found put message
    until User.find_by(name: login_name, id: login_id)
      puts "Press 1 to sign in or 2 to sign up for an account"
      selection = gets.chomp.to_i
      if selection == 1
        puts "Welcome back! Enter your name"
        login_name = gets.chomp
        puts "Enter your gym member number to verify your identity"
        login_id = gets.chomp.to_i
        if User.find_by(name: login_name, id: login_id)
          @current_user = User.find_by(name: login_name, id: login_id)
        end
      else
        puts "Enter your name ex. Ali"
        login_name = gets.chomp
        fitness_level = nil
        until [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(fitness_level)
          puts "Enter your fitness level on a scale 1-10"
          fitness_level = gets.chomp.to_i
          if ![0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(fitness_level)
            puts "Please enter a number between 0 and 10"
          end
        end
        puts "Enter your age"
        age = gets.chomp.to_i
        @current_user = User.create(name: login_name, fitness: fitness_level, age: age)
        puts "Your gym member number is #{@current_user.id}"
      end
    end
    puts "Hello #{@current_user.name}"

  end

  def self.workout_logger
    selection = nil
    until selection == 5
      puts "MAIN MENU \n 1. Log a new workout \n 2. Browse your workout history \n 3. Edit previously logged workouts \n 4. Gym FAQ \n 5. Exit program"
      selection = gets.chomp.to_i

      case selection
      when 1
        log_new_workout
      when 2
        browse_workout_history
      when 3
        edit_workout
      when 4
        gym_faq
      when 5
        puts "Exiting... BYE!"
      else
        puts "Invalid selection. Try again."
      end
    end
  end

  def self.log_new_workout
    puts "Great! Let's log a new workout..."
    puts "When did you workout?"
    time_select = nil
    until time_select == 1 || time_select == 2
      puts "Select 1 for morning or 2 for evening"
      time_select = gets.chomp.to_i
      if time_select == 1
        time = "Morning"
      elsif time_select == 2
        time = "Evening"
      else
        puts "Invalid selection. Try again"
      end
    end
    puts "Which facility did you use?"
    loc_select = nil
    until [1, 2, 3, 4, 5, 6].include?(loc_select)
      puts "Enter the correct number: \n 1. Pool \n 2. Cardio Room \n 3. Weight Room \n 4. Yoga Studio \n 5. Basketball Court \n 6. Rock Climbing Wall"
      loc_select = gets.chomp.to_i
      if ![1, 2, 3, 4, 5, 6].include?(loc_select)
        puts "Invalid selection. Try again"
      end
    end
    name = "#{@current_user.name}, #{time}, #{Location.find(loc_select).name}"
    puts "Which playlist did you listen to?"
    play_select = nil
    until [1, 2, 3, 4, 5, 6].include?(play_select)
      puts "Enter the correct number: \n 1. Pump Up \n 2. Workout Rap \n 3. Beast Mode \n 4. Rock Me Up \n 5. HIIT Pop \n 6. Electro Workout"
      play_select = gets.chomp.to_i
      if ![1, 2, 3, 4, 5, 6].include?(play_select)
        puts "Invalid selection. Try again"
      end
    end
    puts "How many calories did you burn?"
    calories = 0
    until calories > 0
      calories = gets.chomp.to_i
      if calories < 1
        puts "Please enter a number greater than 0"
      end
    end
    rating = nil
    until [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(rating)
      puts "How would you rate your workout on a scale of 0 to 10"
      rating = gets.chomp.to_i
      if ![0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(rating)
        puts "Please enter a number between 0 and 10"
      end
    end
    puts "How many minutes did you spend working out?"
    duration = 0
    until duration > 0
      duration = gets.chomp.to_i
      if duration < 1
        puts "Please enter a number greater than 0"
      end
    end
    puts "You can add any notes about your workout here:"
    notes = gets.chomp

    @new_workout = Workout.create(
      name: name,
      time: time,
      user: @current_user,
      location: Location.find(loc_select),
      calories_burned: calories,
      duration_mins: duration,
      rating: rating,
      notes: notes,
      playlist: Playlist.find(play_select)
    )
  end

  def self.edit_workout #make option to delete workout
    puts "Here is a list of your logged workouts"
    puts "Select the workout ID of the workout you'd like to edit"
    workout_hash = {}
    @current_user.workouts.each do |w|
      puts "Workout ID: #{w.id} \n Workout Name: #{w.name}"
      workout_hash[w.id]=w.name
    end

    wo_id = nil
    until workout_hash.keys.include?(wo_id)
      wo_id = gets.chomp.to_i
      if !workout_hash.keys.include?(wo_id)
        puts "Invalid input. Select the workout ID of the workout you'd like to edit"
        @current_user.workouts.each do |w|
          puts "Workout ID: #{w.id} #{w.name}"
        end
      end
    end

    wo = @current_user.workouts.find(wo_id)
    puts " Name: #{wo.name} \n Time of day: #{wo.time} \n Rating: #{wo.rating} \n Length: #{wo.duration_mins} mins \n Cals Burned: #{wo.calories_burned} cals \n Playlist: #{wo.playlist.name} \n Notes: #{wo.notes} \n **************"
    puts "Which workout detail do you want to edit?"
    puts "Select a number below: \n 1. Time of day \n 2. Facility \n 3. Calories Burned \n 4. Duration \n 5. Rating \n 6. Notes \n 7. Playlist"

    item_edit = nil
    until [1, 2, 3, 4, 5, 6, 7].include?(item_edit)
      item_edit = gets.chomp.to_i
      if ![1, 2, 3, 4, 5, 6, 7].include?(item_edit)
        puts "Invalid selection. Try again."
        puts "Select a number below: \n 1. Time of day \n 2. Facility \n 3. Calories Burned \n 4. Duration \n 5. Rating \n 6. Notes \n 7. Playlist"
      end
    end
    loc_select = Workout.find(wo_id).location.id
    play_select = Workout.find(wo_id).playlist.id

    time = wo.time
    case item_edit
    when 1
      time_select = nil
      until time_select == 1 || time_select == 2
        puts "Select 1 for morning or 2 for evening"
        time_select = gets.chomp.to_i
        if time_select == 1
          time = "Morning"
        elsif time_select == 2
          time = "Evening"
        else
          puts "Invalid selection. Try again"
        end
      end
    when 2
      puts "Which facility did you use?"
      loc_select = nil
      until [1, 2, 3, 4, 5, 6].include?(loc_select)
        puts "Enter the correct number: \n 1. Pool \n 2. Cardio Room \n 3. Weight Room \n 4. Yoga Studio \n 5. Basketball Court \n 6. Rock Climbing Wall"
        loc_select = gets.chomp.to_i
        if ![1, 2, 3, 4, 5, 6].include?(loc_select)
          puts "Invalid selection. Try again"
        end
      end
    when 3
      puts "How many calories did you burn?"
      calories = 0
      until calories > 0
        calories = gets.chomp.to_i
        if calories < 1
          puts "Please enter a number greater than 0"
        end
      end
    when 4
      puts "How many minutes did you spend working out?"
      duration = 0
      until duration > 0
        duration = gets.chomp.to_i
        if duration < 1
          puts "Please enter a number greater than 0"
        end
      end
    when 5
      rating = nil
      until [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(rating)
        puts "How would you rate your workout on a scale of 0 to 10"
        rating = gets.chomp.to_i
        if ![0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10].include?(rating)
          puts "Please enter a number between 0 and 10"
        end
      end
    when 6
      puts "You can add any notes about your workout here:"
      notes = gets.chomp
    when 7
      puts "Which playlist did you listen to?"
      play_select = nil
      until [1, 2, 3, 4, 5, 6].include?(play_select)
        puts "Enter the correct number: \n 1. Pump Up \n 2. Workout Rap \n 3. Beast Mode \n 4. Rock Me Up \n 5. HIIT Pop \n 6. Electro Workout"
        play_select = gets.chomp.to_i
        if ![1, 2, 3, 4, 5, 6].include?(play_select)
          puts "Invalid selection. Try again"
        end
      end
    end

    select_hash = {
      1 => {time: time},
      2 => {location: Location.find(loc_select)},
      3 => {calories_burned: calories},
      4 => {duration_mins: duration},
      5 => {rating: rating},
      6 => {notes: notes},
      7 => {playlist: Playlist.find(play_select)}
    }

    workout = @current_user.workouts.find { |wo| wo.id == wo_id}
    workout.update(select_hash[item_edit])
    name = "#{@current_user.name}, #{time}, #{Location.find(loc_select).name}"
    workout.update(name: name)
    puts "Edit confirmed. Exiting to main menu..."
  end

  def self.browse_workout_history
    puts "Welcome to your logged workouts!"
    select_info = nil
    puts "Select an option from the menu:"
    until select_info == 9
      puts "Select a number below:"
      puts "
        1. list your workouts \n
        2. find your workouts by facility \n
        3. find your workouts by time of day \n
        4. find your workout that burned most calories \n
        5. find your highest rated workout \n
        6. find your longest workout \n
        7. find your most played playlist \n
        8. find your highest rated playlist \n
        9. Exit to main menu...
      "
      select_info = gets.chomp.to_i
      case select_info
      when 2
        puts "Which facility do you want to select?"
        loc_select = nil
        until [1, 2, 3, 4, 5, 6].include?(loc_select)
          puts "Enter the correct number: \n 1. Pool \n 2. Cardio Room \n 3. Weight Room \n 4. Yoga Studio \n 5. Basketball Court \n 6. Rock Climbing Wall"
          loc_select = gets.chomp.to_i
          if ![1, 2, 3, 4, 5, 6].include?(loc_select)
            puts "Invalid selection. Try again"
          end
        end
        if @current_user.find_workouts_by_facility(loc_select) == []
          puts "You have not worked out in the #{Location.find(loc_select).name}"
        else
          puts @current_user.find_workouts_by_facility(loc_select)
        end
      when 3
        time_select = nil
        until time_select == 1 || time_select == 2
          puts "Select 1 for morning or 2 for evening"
          time_select = gets.chomp.to_i
          if time_select == 1
            time = "Morning"
          elsif time_select == 2
            time = "Evening"
          else
            puts "Invalid selection. Try again"
          end
        end
        if @current_user.find_workouts_by_time_of_day(time) == []
          puts "You have not worked out in the #{time}"
        else
           puts @current_user.find_workouts_by_time_of_day(time)
        end
      when 7
        @current_user.most_played_playlist
      when 8
        @current_user.highest_rated_playlist
      when 1
        @current_user.list_workouts_by_name
      when 4
        @current_user.max_cals_burned
      when 5
        @current_user.highest_rated_workout
      when 6
        @current_user.longest_workout
      when 9
        puts "Exiting back to menu..."
      else
        puts "Invalid selection. Try again."
      end
    end
  end


  def self.gym_faq
    puts "Welcome to FAQ!"
    select_info = nil
    puts "Select an option from the menu:"
    until select_info == 14
      puts "Select a number below:"
      puts "
      1. list all facilities \n
      2. list empty facilities \n
      3. list crowded facilities \n
      4. list dirty facilities \n
      5. list clean facilities \n
      6. find average workout length \n
      7. find average calories burned during a workout \n
      8. find average workout rating \n
      9. find average gym member age \n
      10. list all playlists \n
      11. find highest rated playlist \n
      12. find most popular playlist \n
      13. find longest playlist \n
      14. Exit to main menu.... \n
      "
      select_info = gets.chomp.to_i
      case select_info
      when 6
        Workout.avg_workout_length
      when 8
        Workout.avg_workout_rating
      when 7
        Workout.avg_calories_burned
      when 9
        User.avg_age
      when 11
        Playlist.best_rated
      when 13
        Playlist.longest_playlist
      when 12
        Playlist.most_popular
      when 10
        Playlist.list_playlists
      when 5
        Location.find_clean
      when 4
        Location.find_dirty
      when 2
        Location.find_empty
      when 3
        Location.find_crowded
      when 1
        Location.list_all_facilities
      when 14
        puts "Exiting back to menu..."
      else
        puts "Invalid selection. Try again."
      end
    end
  end
end
