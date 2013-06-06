FactoryGirl.define do

  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do |f|
    f.name_first        "Joe"
    f.name_last         "Userr"
    f.email             
    f.password          "123"

    factory :user_with_galleries do

      ignore do
        gallery_count 5
      end

      after(:create) do |user, evaluator|
        FactoryGirl.create_list(:gallery, evaluator.gallery_count, user: user)
      end
    end

  end

end 