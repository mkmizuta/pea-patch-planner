class Tool < ActiveRecord::Base
  has_many :tools_users
  has_many :users, through: :tools_users
  
  validates :name, presence: true
  validates :description, presence: true
  validates :owner, presence: true
end