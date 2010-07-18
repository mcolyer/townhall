require "ostruct"

TownhallConfig = OpenStruct.new(YAML::load(File.open("#{Rails.root}/config/townhall.yml"))[Rails.env])
