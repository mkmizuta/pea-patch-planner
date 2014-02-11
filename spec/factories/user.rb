FactoryGirl.define do
  factory :user do
    username 'farmer'
    email    'farmer@farmer.com'
    password 'pass1234'  
    password_confirmation 'pass1234'     
    uid      '1'
    admin    true
  end
end