# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject_type do
    name "MyString"
    is_rated false
  end
end
