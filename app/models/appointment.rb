class Appointment < ApplicationRecord
  belongs_to :agent
  belongs_to :user
  belongs_to :availability
end
