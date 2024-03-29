class User < ActiveRecord::Base

  self.table_name = 'portalusers'
  attr_accessible :username, :email, :password, :password_confirmation, :localisto_staff,  :is_active


 has_many :portaluserassignments
 has_many :agencies, :through => :portaluserassignments


  attr_accessor :password
  before_save :prepare_password
  before_save :lowercaseloginandemail


  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = find_by_username(login.downcase) || find_by_email(login.downcase)
    return user if user && user.password_hash == user.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  
def lowercaseloginandemail
    self.username = self.username.downcase
    self.email = self.email.downcase

  end

end



end
