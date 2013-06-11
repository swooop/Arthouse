require 'spec_helper'

describe Image do
  let(:image) { FactoryGirl.create(:image) }

  it "has a valid factory" do
    expect(image).to be_valid
  end

  it "has a title" do
    expect(image.title).to_not be_empty
  end

  it "is invalid without a title" do
    expect(FactoryGirl.build(:gallery, title: nil)).not_to be_valid
  end

  it "has a description" do
    expect(image.title).to_not be_empty
  end

  it "belongs to a gallery" do
    expect(image.gallery).to be_an_instance_of(Gallery)
  end
end
