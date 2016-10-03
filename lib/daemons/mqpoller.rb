#!/usr/bin/env ruby

# You might want to change this
#ENV["RAILS_ENV"] ||= "production"
ENV["RAILS_ENV"] ||= "development"

root = File.expand_path(File.dirname(__FILE__))
root = File.dirname(root) until File.exists?(File.join(root, 'config'))
Dir.chdir(root)

require File.join(root, "config", "environment")
$running = true
Signal.trap("TERM") do 
  $running = false
end

while($running) do

  # Replace this with your code
  Rails.logger.auto_flushing = true
  Rails.logger.info "This daemon is still running at #{Time.now}.\n"

  Rails.logger = Logger.new(STDOUT)
  # ActiveMessaging.logger = Rails.logger
  #
  # ActiveMessaging::load_processors
  #
  # ActiveMessaging::start
  
  sleep 10
end
