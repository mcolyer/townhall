require 'spec_helper'

describe TagsController do
  fixtures :users

  it "can create a tag using json" do
    body = { :tag => { :name => "BarbaraHunter:Person", :start => 1, :stop => 10}, :auth_token => users(:admin).authentication_token }
    xhr :post, :create, body

    response.should be_success
    results = JSON.parse(response.body)["tag"]
    results.should have_key "name"
    results.should have_key "start"
    results.should have_key "stop"
  end
end
