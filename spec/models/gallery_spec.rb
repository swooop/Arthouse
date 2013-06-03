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


end