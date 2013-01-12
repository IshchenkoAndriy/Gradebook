# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :double_class do
    numerator_denominator 1
    subgroup 1
    double_class_number "MyString"
    day_of_week 1
  end
end
