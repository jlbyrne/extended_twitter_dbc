# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'

require 'twitter'

Twitter.configure do |config|
  config.consumer_key = "cE2RW18jqWBipqkfDiS4sg"
  config.consumer_secret = "Mn6b1HCvZnXbMXAdDSeTtDMoO2njgqDfdeUg8f0OjM"
  config.oauth_token = "132247348-pbhAJyOu6Pn9Ek8Tgumchbpdfw4OrAjiQGphLIBv"
  config.oauth_token_secret = "byH717JGmSOFrBoLsF0xroCDQaTWHZgzxfyZSumXB8"
end

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')


