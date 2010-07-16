require 'spec_helper'

describe MeetingsController do
  it "can create a meeting using json" do
    body = { :meeting => { :meeting_date => "2010-07-15", :url => "http://s3.external.com" } }
    post :create, body
    response.should be_redirect
  end
end
