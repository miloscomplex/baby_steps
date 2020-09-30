class CareGiver < ActiveRecord::Base
  validates_presence_of :name, :email
  has_secure_password

  has_many :children
end
