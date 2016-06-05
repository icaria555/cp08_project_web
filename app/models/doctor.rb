class Doctor < ActiveRecord::Base
  attr_accessible :name, :uid
  validates :name, :presence => true , :length => { :maximum => 30 }, uniqueness: true
  validates :uid, :presence => true
  has_many :health
  
  before_save :capitalize_name
  def capitalize_name
    self.name = self.name.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end
end