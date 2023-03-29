# == Schema Information
#
# Table name: appointments
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  agent_id        :integer          not null
#  availability_id :integer          not null
#  user_id         :integer          not null
#
# Indexes
#
#  index_appointments_on_agent_id         (agent_id)
#  index_appointments_on_availability_id  (availability_id)
#  index_appointments_on_user_id          (user_id)
#
# Foreign Keys
#
#  agent_id         (agent_id => agents.id)
#  availability_id  (availability_id => availabilities.id)
#  user_id          (user_id => users.id)
#
require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
