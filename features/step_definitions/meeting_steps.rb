Given /^the following meetings:$/ do |meetings|
  Meeting.create!(meetings.hashes)
end

Then /^I should see the following meetings:$/ do |expected_meetings_table|
  expected_meetings_table.diff!(tableish('table tr', 'td,th'))
end
