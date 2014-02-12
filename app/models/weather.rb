class Weather < ActiveRecord::Base
  has_many :days_weathers
  validates :dt, presence: true

  

end