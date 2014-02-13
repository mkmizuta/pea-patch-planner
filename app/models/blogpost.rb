class Blogpost < ActiveRecord::Base
  belongs_to :user
  # has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :post_text, presence: true
  validates :user_id, presence: true
  
end
