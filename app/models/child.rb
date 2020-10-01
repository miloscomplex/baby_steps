class Child  < ActiveRecord::Base
  validates_presence_of :name, :birthdate, :gender
  belongs_to :care_giver
  has_many :logs
end
