FactoryGirl.define do
  factory :user do |f|
    f.name_first        "Joe"
    f.name_last         "Userr"
    f.email             "joe@user.com"

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