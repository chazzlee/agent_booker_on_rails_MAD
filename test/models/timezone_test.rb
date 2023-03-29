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
require "test_helper"

class TimezoneTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
