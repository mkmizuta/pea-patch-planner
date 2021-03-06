class User < ActiveRecord::Base
  has_many :tools_users
  has_many :tools, through: :tools_users

  has_many :events

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, on: :update
  validates :email, uniqueness: true
  validates :email, format: { with: /\w+@+\w+\.+\w+/ }, on: :update
  validates :uid, presence: true, uniqueness: true #, format: { with: /\w+/}

  before_save :check_for_first_user

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

  def check_for_first_user
    if User.all.count == 0
      self.admin = true
    end
  end
end
