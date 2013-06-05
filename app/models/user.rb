require 'digest/md5'
require 'bcrypt'

class User < ActiveRecord::Base
  has_many :galleries
  attr_accessible :email, :name_first, :name_last, :password, :password_confirmation


  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :password, :on => :create

  has_secure_password

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
