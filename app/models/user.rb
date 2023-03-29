# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string           default("guest")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :appointments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
