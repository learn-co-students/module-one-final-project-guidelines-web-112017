require 'pry'

class Cli
  @current_user = nil
  def self.greeting
    puts "Welcome to your workout log!"
  end

  def self.user_login #loop until it gets 1 or 2 as a selection,
    puts "Press 1 to sign in or 2 to sign up for an account"
    selection = gets.chomp.to_i
    if selection == 1
      puts "Welcome back! Enter your name ex. Ali"
      login_name = gets.chomp
      puts "Enter your id number to verify your identity"
      login_id = gets.chomp.to_i
      @current_user = User.find_by(name: login_name, id: login_id)
      #if current user is nil they need to try typing in their info again or chose to create a new account
    else
      puts "Enter your name ex. Ali"
      login_name = gets.chomp
      @current_user = User.create(name: login_name)
      puts "Your id number is #{@current_user.id}"
    end
    puts "Helllo #{@current_user.name}"
    #get fitness level
  end

  def self.get_workout_info
    puts "Let's log your workout"
    puts "Press 1 to log a new workout or 2 to edit an existing workout"
    selection = gets.chomp.to_i
    if selection == 1
      puts "What time did you workout?"
      puts "Select 1 for morning or 2 for evening"
      time_select = gets.chomp.to_i
      if time_select == 1
        time = "Morning"
      else
        time = "Evening"
      end
      puts "Which facility did you use?"
      puts "Select a number below: \n 1. Pool \n 2. Cardio Room \n 3. Weight Room \n 4. Yoga Studio"
      loc_select = gets.chomp.to_i
      #when entering locations into table use this order so the selected number matches their id
      #add name column to workouts = Username timeofday location
      puts "Which playlist did you listen to?"
      puts "Select a number below: \n 1. Pump Up Jams \n 2. Smooth Jazz \n 3. Classic Rock \n 4. Hip-Hop"
      play_select = gets.chomp.to_i
      puts "How many calories did you burn?"
      calories = gets.chomp.to_i
      puts "How would you rate your workout on a scale of 1 to 10"
      rating = gets.chomp.to_i
      puts "How many minutes did you spend in your workout?"
      duration = gets.chomp.to_i
      puts "You can add any notes about your workout here:"
      notes = gets.chomp
    else
      #update which thing
      puts "Which workout do you want to edit?"
      @current_user.workouts.each do |w|
        puts "#{w.id} #{w.description}" #need to make name later
      end
      wo_id = gets.chomp.to_i
      #make sure wo_id is one of the options above
      puts "Which workout detail do you want to edit?"
      puts "Select a number below: \n 1. Time of day \n 2. Facility \n 3. Calories Burned \n 4. Duration \n 5. Rating \n 6. Notes \n 7. Playlist"
      item_edit = gets.chomp.to_i
      puts "Type in the change for your selection"
      change = gets.chomp #display options for that detail
      select_hash = {
        1 => {time: change},
        2 => {location: change},
        3 => {calories_burned: change},
        4 => {duration_mins: change},
        5 => {rating: change},
        6 => {description: change},
        7 => {playlist: change}
      }
      Workout.find(wo_id).update(select_hash[item_edit])
      #if they want to update more than one detail of a workout
    end
  end

  def self.get_stats
  end
end
