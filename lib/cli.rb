require 'pry'

#refactor everything in this file?
class Cli
  @current_user = nil
  def self.greeting
    puts "Welcome to your workout log!"
  end

  def self.user_login
    puts "Press 1 to sign in or 2 to sign up for an account"
    selection = gets.chomp.to_i
    if selection == 1
      puts "Welcome back! Enter your name ex. Ali"
      login_name = gets.chomp
      puts "Enter your gym member number to verify your identity"
      login_id = gets.chomp.to_i
      @current_user = User.find_by(name: login_name, id: login_id)
      #if current user is nil they need to try typing in their info again or chose to create a new account
    else
      puts "Enter your name ex. Ali"
      login_name = gets.chomp
      puts "Enter your fitness level on a scale 1-10"
      fitness_level = gets.chomp.to_i
      @current_user = User.create(name: login_name, fitness: fitness_level)
      puts "Your gym member number is #{@current_user.id}"
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
      puts "Workout ID: #{w.id} #{w.name}"
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

    Workout.find(wo_id).update(select_hash[item_edit])
    name = "#{@current_user.name}, #{time}, #{Location.find(loc_select).name}"
    Workout.find(wo_id).update(name: name)

  end

  def self.browse_workout_history
    puts "Welcome to your logged workouts!"
    select_info = nil
    puts "Select an option from the menu:"
    until select_info == 100
      puts "Select a number below: 1 2 3 4 ... 16 or 100 to go back to main menu "
      select_info = gets.chomp.to_i
      case select_info
      when 1
        puts @current_user.find_pool_workouts
      when 2
        puts @current_user.find_lifting_workouts
      when 3
        puts@current_user.find_last_workout
      when 4
        puts @current_user.favorite_playlist
      when 100
        puts "Exiting back to menu..."
      else
        puts "Invalid selection. Try again."
      end
    end
  end


  # def self.gym_faq
  #
  # end

  # # def self.get_stats
  # #   select_info = nil
  # #   puts "What do you want know"
  # #   until select_info == 100
  # #     puts "Select a number below: 1 2 3 4 ... 16 or 100 to stop "
  # #     select_info = gets.chomp.to_i
  # #     case select_info
  # #       when 1
  # #         puts Workout.longest
  # #       when 2
  # #         puts Workout.highest_rated
  # #       when 3
  # #         puts Workout.most_cals_burned
  # #       when 5
  # #         puts @current_user.find_pool_workouts #instance method
  # #       when 6
  # #         puts @current_user.find_lifting_workouts #instance method
  # #       when 7
  # #         puts @current_user.find_last_workout #instance method
  # #       when 8
  # #         puts @current_user.favorite_playlist #instance method
  # #       when 9
  # #         puts Playlist.most_played
  # #       when 10
  # #         puts Playlist.best_rated
  # #       when 11
  # #         puts Playlist.longest_playlist
  # #       when 12
  # #         #puts Playlist.genre_count(genre)
  # #       when 13
  # #         puts Location.find_clean
  # #       when 14
  # #         puts Location.find_dirty
  # #       when 15
  # #         puts Location.find_empty
  # #       when 16
  # #         puts Location.find_crowded
  # #       when 100
  # #         puts "Exiting..."
  # #       else
  # #         puts "Not an option try again."
  # #     end
  #   end
  # end
end
