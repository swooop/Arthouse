FactoryGirl.define do
  factory :gallery do |f|
    f.title       "A Gallery"
    f.description  "Some eipc rubbish in here because lorem tab doesn't work"
    f.user        { FactoryGirl.create(:user, name_first: "Jimbob") }
  end
end 