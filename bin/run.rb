require_relative '../config/environment'
require_relative '../lib/cli'

Cli.greeting
Cli.user_login #find or create user_id aka gym id & name
Cli.workout_logger #prompt to create a workout
# Cli.get_stats #prompt to recieve stats via cli numbers
