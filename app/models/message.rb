class Message < ActiveRecord::Base
  #attr_accessible :massages, :read_unread, :time
  belongs_to :conversation
  validates :massages, :presence => true
  validates :read_unread, :presence => true
  validates :time, :presence => true
end