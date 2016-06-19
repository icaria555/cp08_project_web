class User < ActiveRecord::Base
  attr_accessible :name, :uid, :user_class
  validates :name, :presence => true , :length => { :maximum => 30 }, uniqueness: true
  validates :user_class, :presence => true
  validates :uid, :presence => true
  has_many :health, :dependent => :delete_all
  has_many :relation, :dependent => :delete_all
  
  before_save :capitalize_name
  def capitalize_name
    self.name = self.name.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end

  def self.class_user ; %w[Admin Doctor Patient] ; end
end