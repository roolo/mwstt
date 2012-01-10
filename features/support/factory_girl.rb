require 'factory_girl_rails'
require 'factory_girl/step_definitions'

FactoryGirl.define do
  sequence :username do |n|
    "test#{n}"
  end
end
