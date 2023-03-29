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
require "test_helper"

class AgentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
