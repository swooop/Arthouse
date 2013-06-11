require 'spec_helper'

describe Gallery do
  let(:gallery)             { FactoryGirl.create(:gallery) }
  let(:gallery_with_images) { FactoryGirl.create(:gallery_with_images) }

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

  describe '.first_image' do
    it "returns an image object when the gallery has images" do
      expect(gallery_with_images.first_image).to be_an_instance_of(Image)
    end
    it "returns nil when the gallery has no images" do
      expect(gallery.first_image).to be_nil
    end
  end


end