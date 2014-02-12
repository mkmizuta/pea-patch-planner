class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@+\w+\.+\w+/ }
  #validates :uid, presence: true, uniqueness: true, format: { with: /\w+/}
    #perhaps create a validation where EITHER a uid or password is required to handle the twitter and non-twitter cases respectively
  validates :password, presence: true, length: { minimum: 6, too_short: "must be at least 6 characters" }
  validates_confirmation_of :password
  validates :password_confirmation, presence: true 

  before_save :hash_password

  def hash_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def self.authenticate(username, password)
    if user = find_by_username(username)
      if BCrypt::Password.new(user.password_digest).is_password? password
        return user
      end
    end

    return nil
  end
end


 # def self.find_or_create_from_omniauth(auth_hash)
 #    user = User.find_by(uid: auth_hash["uid"]) || create_from_omniauth(auth_hash)
 #    return unless user
 #    user.update(access_token:         auth_hash["credentials"]["token"],
 #                access_token_secret:  auth_hash["credentials"]["secret"])
 #    user
 #  end

 #  def self.create_from_omniauth(auth_hash)
 #    user = self.create(
 #      uid:                  auth_hash["uid"],
 #      provider:             auth_hash["provider"],
 #      avatar_url:           auth_hash["info"]["image"],
 #      username:             auth_hash["info"]["nickname"],
 #      access_token:         auth_hash["credentials"]["token"],
 #      access_token_secret:  auth_hash["credentials"]["secret"]
 #    )
 #    if user.valid? 
 #      user
 #    else
 #      nil
 #    end
 #  end

  # def tweet(tweet_body)
  #   user_client = Twitter::REST::Client.new do |config|
  #     config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  #     config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  #     config.access_token        = self.access_token
  #     config.access_token_secret = self.access_token_secret
  #   end
  #   user_client.update(tweet_body)
  # end
# end
