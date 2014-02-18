class User < ActiveRecord::Base
  

  #FOLLOW UP w/TEAM
  #has_secure_password 
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@+\w+\.+\w+/ }, if: :not_twitter_user?
  #validates :uid, presence: true, uniqueness: true, format: { with: /\w+/}
    #perhaps create a validation where EITHER a uid or password is required to handle the twitter and non-twitter cases respectively
  validates :password, presence: true, length: { minimum: 6, too_short: "must be at least 6 characters" }, if: :not_twitter_user?
  validates_confirmation_of :password, if: :not_twitter_user?
  validates :password_confirmation, presence: true, if: :not_twitter_user?

  before_save :hash_password

  def hash_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def self.authenticate(username,password)
    if user = find_by_username(username)
      if user.uid 
        auth = { provider: user.provider, uid: user.uid }
        User.from_omniauth(auth)
      else BCrypt::Password.new(user.password_digest).is_password? password
        return user
      end
    end

    return nil
  end

  def not_twitter_user?
    if self.uid
      return false
    else
      return true
    end
  end

  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"]
    end
  end
end
