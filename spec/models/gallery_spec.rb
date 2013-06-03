require 'spec_helper'

describe Gallery do
  let(:gallery) { FactoryGirl.create(:gallery) }

  it "has a valid factory" do
    expect(gallery).to be_valid
  end

  it "has a title" do
    expect(gallery.title).to_not be_empty
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:gallery, title: nil)).not_to be_valid
  end

  it "belongs to a user" do
    expect(gallery.user).to be_an_instance_of(User)
  end


end