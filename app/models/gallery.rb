class Gallery < ActiveRecord::Base
  attr_accessible :description, :title, :user, :images, :images_attributes
  has_many :images
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  belongs_to :user

  validates :title, presence: true

  def first_image
    self.images.first if self.images.length > 0
  end

  def thumb
    self.images.sample(:thumb) if self.images.length > 0
  end

end
