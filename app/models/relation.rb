class Relation < ActiveRecord::Base
  attr_accessible :patient_id
  belongs_to :user
end