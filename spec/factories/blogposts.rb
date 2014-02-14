# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogpost do
    title "MyString"
    post_text "MyText"
    pic_upload "MyString"
    user_id 
  end
end
