# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image do
    title       "MyString"
    description "MyText"
    gallery     { FactoryGirl.create(:gallery) }
  end
end
