# Load the rails application
require File.expand_path('../application', __FILE__)

# Load in the Townhall configuration, as some initializers require it
require "ostruct"
TownhallConfig = OpenStruct.new(YAML::load(File.open("#{Rails.root}/config/townhall.yml"))[Rails.env])

# Initialize the rails application
Townhall::Application.initialize!
