# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
  	user
  	title "WiFi-sniffing Shoes"
  	teaser "Find nearby networks just by walking!"
  	description "These are really great shoes."
  	goal 100000
  end
end
