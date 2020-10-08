class User < ActiveRecord::Base
  include BCrypt
  validates :name, :presence => true, :length => { :maximum => 30 }, uniqueness: true
  validates :uid, :presence => true, :length => { :maximum => 30 }, uniqueness: true
  validates :password, :presence => true
  validates :user_class, :presence => true
  has_many :health, :dependent => :delete_all
  has_many :relation, :dependent => :delete_all
  
  before_save :capitalize_name, :hash_password
  
  def capitalize_name
    self.name = self.name.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end
  
  def hash_password
    self.password = Password.create(self.password)
  end
  
  def get_password
    self.password
  end

  def self.class_user ; %w[Admin Doctor Patient] ; end
end