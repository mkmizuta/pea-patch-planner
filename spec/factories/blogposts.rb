# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogpost do
    title "MyTitle"
    user_id 1
    pic_upload "MyString"
    post_text "My Text"
    
  end
end

