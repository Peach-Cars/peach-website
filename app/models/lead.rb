# Model for Leads base class
class Lead < ApplicationRecord
  validates :full_name, :email, :phone, presence: true
  self.inheritance_column = :type
end
