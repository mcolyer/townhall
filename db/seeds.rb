# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

User.create(:name => 'System User', :authentication_token => TownhallConfig.system_user_token)
