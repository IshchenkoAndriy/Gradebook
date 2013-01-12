# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :presence do
    date "2013-01-12"
    was_present false
    scores 1
  end
end
