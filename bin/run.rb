require_relative '../config/environment'

ActiveRecord::Base.logger = nil

GameRunner.new
