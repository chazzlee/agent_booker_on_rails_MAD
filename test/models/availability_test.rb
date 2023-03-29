# == Schema Information
#
# Table name: availabilities
#
#  id          :integer          not null, primary key
#  day_of_week :string           not null
#  end_until   :time             not null
#  reserved    :boolean          default(FALSE), not null
#  start_at    :time             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  agent_id    :integer          not null
#
# Indexes
#
#  index_availabilities_on_agent_id  (agent_id)
#
# Foreign Keys
#
#  agent_id  (agent_id => agents.id)
#
require "test_helper"

class AvailabilityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
