class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@+\w+\.+\w+/ }
  validates :uid, presence: true, uniqueness: true, format: { with: /\w+/}
end