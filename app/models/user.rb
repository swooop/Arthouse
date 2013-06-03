require 'digest/md5'
require 'bcrypt'

class User < ActiveRecord::Base
  has_many :galleries
  validates :name_first, :name_last, :email, presence: true
  validates_presence_of :password, :on => :create
  attr_accessible :email, :name_first, :name_last
  attr_accessor :password, :password_confirmation

  #has_secure password

  before_validation :downcase_email

  def name_full
    "#{self.name_first} #{self.name_last}"
  end

  def email_as_md5
    Digest::MD5.hexdigest(self.email)  
  end

  def authenticate(password)
    if self.hashed == BCrypt::Engine.hash_secret(password, self.salt)
      self
    else
      nil
    end
  end

  protected

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed = BCrypt::Engine.hash_secret(password, self.salt)
      self.password = nil
    end
  end

  def downcase_email
    self.email.downcase!
  end

end
