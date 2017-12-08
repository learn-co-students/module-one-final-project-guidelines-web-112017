require_relative '../config/environment'
require_relative '../lib/cli'

ActiveRecord::Base.logger = nil

Cli.greeting
Cli.user_login
Cli.workout_logger
