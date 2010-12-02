require 'spec_helper'

describe MeetingsController do
  fixtures :users

  it "can create a meeting using json" do
    body = { :meeting => { :meeting_date => "2010-07-15"}, :auth_token => users(:admin).authentication_token }
    xhr :post, :create, body

    response.should be_success
    results = JSON.parse(response.body)["meeting"]
    results.should have_key "url"
    results.should have_key "meeting_date"
  end
end
