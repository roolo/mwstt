# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :datetime do
    start "2012-01-10 14:14:51"
    stop "2012-01-10 15:14:51"
    description "MyText"
    user
    activity
  end
end
