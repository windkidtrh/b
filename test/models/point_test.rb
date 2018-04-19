# == Schema Information
#
# Table name: points
#
#  id                  :integer          not null, primary key
#  original_thinckness :float
#  current_thinckness  :float
#  num                 :integer
#  equip_id            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class PointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
