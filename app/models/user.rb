class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\w+@+\w+\.+\w+/ }
  validates :uid, presence: true, uniqueness: true, format: { with: /\w+/}
end