# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mark do
    date "2013-01-12"
    mark 1
    scores 1
    study_number 1
    study_description "MyString"
  end
end
