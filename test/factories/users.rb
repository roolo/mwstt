# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :username do |n|
    "username#{n}"
  end

  factory :user do
    username { FactoryGirl.generate(:username) }
    email { "#{username}@example.net" }
    password "testtest"
    password_confirmation "testtest"
    
    locale 
  end
end
