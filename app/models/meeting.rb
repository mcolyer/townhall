class Meeting < ActiveRecord::Base
  validates_presence_of :url
  validates_presence_of :meeting_date

  validates_format_of :url, :with => URI.regexp
end
