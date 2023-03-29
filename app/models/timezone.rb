# == Schema Information
#
# Table name: timezones
#
#  id         :integer          not null, primary key
#  full_name  :string
#  offset     :string
#  short_name :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Timezone < ApplicationRecord
  has_many :agents

  validates :offset, presence: true
  validates :short_name, presence: true
  validates :full_name, presence: true
end
