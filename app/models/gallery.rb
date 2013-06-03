class Gallery < ActiveRecord::Base
  attr_accessible :description, :title, :user

  belongs_to :user

  validates :title, presence: true
end
