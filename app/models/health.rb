class Health < ActiveRecord::Base
  attr_accessible :name, :spo2, :h_rate, :h_signal, :check_date
  belongs_to :user
  validates :spo2, :presence => true
  validates :h_rate, :presence => true
  validates :h_signal, :presence => true
end