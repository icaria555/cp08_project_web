class Conversation < ActiveRecord::Base
  attr_accessible :sender_id, :reciever_id
  has_many :message
  validates :sender_id, :presence => true
  validates :reciever_id, :presence => true
end