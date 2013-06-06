class Image < ActiveRecord::Base
  belongs_to :gallery
  mount_uploader :artwork, ArtworkUploader

  attr_accessible :description, :title, :gallery, :artwork
end
