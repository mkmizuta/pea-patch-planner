class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, on: :update
  validates :email, uniqueness: true
  validates :email, format: { with: /\w+@+\w+\.+\w+/ }, on: :update
  validates :uid, presence: true, uniqueness: true #, format: { with: /\w+/}

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
