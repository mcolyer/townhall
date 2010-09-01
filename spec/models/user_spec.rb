require 'spec_helper'

describe User do
  describe "login" do
    before(:each) do
      @email = "test@example.com"
      @id = 1
      @name = "John Doe"
      @token = "token"
      data = "{\"email\" : \"#{@email}\", \"id\" : \"#{@id}\", \"name\" : \"#{@name}\"}"
      @access_token = Object.new
      @access_token.stub!(:get).and_return(data)
      @access_token.stub!(:token).and_return(@token)
    end

    it "can authenticate a new facebook user" do
      user = User.find_for_facebook_oauth(@access_token)

      user.name.should == @name
      user.email.should == @email
      user.facebook_uid.should == @id
      user.facebook_token.should == @token
    end

    it "can re-authenticate an existing user" do
      user = Factory.build(:user)
      user = User.find_for_facebook_oauth(@access_token, user)

      user.facebook_token.should == @token
    end
  end

  it "can create an access token object from storage" do
    user = Factory.build(:user, :facebook_token => "abc")
    access_token = user.oauth_facebook_token
    access_token.should be_kind_of OAuth2::AccessToken
  end
end
