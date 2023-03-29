class Availability < ApplicationRecord
  belongs_to :agent
  has_one :appointment
  has_one :user, through: :appointment
end
