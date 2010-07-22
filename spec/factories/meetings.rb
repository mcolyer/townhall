# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :meeting do |f|
  f.meeting_date Date.new(2010,7,15)
end
