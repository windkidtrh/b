# == Schema Information
#
# Table name: equips
#
#  id            :integer          not null, primary key
#  specie        :string
#  name          :string
#  manufacturer  :string
#  material      :string
#  specification :string
#  device_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  num           :integer
#

require 'test_helper'

class EquipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
