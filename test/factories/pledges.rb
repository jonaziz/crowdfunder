# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pledge do
  	association :user
  	association :project
  	amount 1000
  end

end
