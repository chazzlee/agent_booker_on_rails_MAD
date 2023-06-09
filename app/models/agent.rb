# == Schema Information
#
# Table name: agents
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  timezone_id :integer          not null
#
# Indexes
#
#  index_agents_on_timezone_id  (timezone_id)
#
class Agent < ApplicationRecord
  belongs_to :timezone
  has_many :availabilities
  has_many :appointments

  validates :name, presence: true

  def available_days
    availabilities.distinct.pluck(:day_of_week)
  end

  def get_avatar
    "https://api.multiavatar.com/#{name}.svg"
  end

  def availabilities_grouped_by_day
    availabilities.each_with_object({}) do |av, obj|
      if obj[av.day_of_week].present?
        obj[av.day_of_week].concat([av])
      else
        obj[av.day_of_week] = [av]
      end
    end
  end
end
