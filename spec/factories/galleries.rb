FactoryGirl.define do
  factory :gallery do
    title       "A Gallery"
    description  "Some epic rubbish in here because lorem tab doesn't work"
    user        { FactoryGirl.create(:user, name_first: "Jimbob") }

    factory :gallery_with_images do
      images { FactoryGirl.create_list(:image, 5) }
    end
  end
end 