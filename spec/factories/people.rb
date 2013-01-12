# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "MyString"
    second_name "MyString"
    patronymic "MyString"
    birth_day "MyString"
    phone "MyString"
    email "MyString"
  end
end
