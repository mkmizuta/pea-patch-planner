# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blogpost do
    title "MyTitle"
    sequence :post_text do |n| 
      "My Text #{n}"
    end
    pic_upload "MyString"
    sequence :user_id do |n| 
      n
    end
  end
end
