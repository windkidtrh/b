# == Schema Information
#
# Table name: pgrades
#
#  id           :integer          not null, primary key
#  severe_point :float            default(0.5)
#  minor_point  :float            default(0.8)
#  point_num    :integer
#  equip_id     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class PgradeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
