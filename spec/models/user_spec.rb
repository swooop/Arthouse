require 'spec_helper'

describe User do
  let(:user)                { FactoryGirl.create(:user) }
  let(:user_with_galleries) { FactoryGirl.create(:user_with_galleries) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "has a first name" do
    expect(user.name_first).to_not be_empty
  end

  it "is invalid without a first name" do
    expect(FactoryGirl.build(:user, name_first: nil)).not_to be_valid
  end

  it "has a last name" do
    expect(user.name_last).to_not be_empty
  end

  it "is invalid without a last name" do
    expect(FactoryGirl.build(:user, name_last: nil)).not_to be_valid
  end

  it "has an email address" do
    expect(user.email).to_not be_empty
  end

  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end

  it "has many galleries" do

    expect(user_with_galleries.galleries).not_to be_empty
    user.galleries.each do |gallery|
      expect(gallery).to be_an_instance_of(Gallery)
    end
  end

end