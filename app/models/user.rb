class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :oauthable
  # :database_authenticatable, :registerable, :recoverable, :rememberable,
  # :trackable, :validatable
  devise :oauthable, :trackable, :token_authenticatable

  attr_accessible :email, :name, :facebook_uid, :facebook_token

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = JSON.parse(access_token.get('/me'))

    if user = signed_in_resource || User.find_by_email(data['email'])
      user.update_attribute(:facebook_token, access_token.token)
      user
    else
      User.create!(:name => data['name'], :email => data['email'],
                   :facebook_uid => data['id'].to_i,
                   :facebook_token => access_token.token)
    end
  end

  def oauth_facebook_token
    @oauth_facebook_token ||= self.class.oauth_access_token(:facebook, facebook_token)
  end
end
