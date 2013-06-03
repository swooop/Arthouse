require 'digest/md5'
require 

class User < ActiveRecord::Base
  has_many :galleries
  validates :name_first, :name_last, :email, presence: true
  attr_accessible :email, :name_first, :name_last

  before_validation :downcase_email

  def name_full
    "#{self.name_first} #{self.name_last}"
  end

  def email_as_md5
    Digest::MD5.hexdigest(self.email)  
  end

  protected

  def downcase_email
    self.email.downcase!
  end

end
