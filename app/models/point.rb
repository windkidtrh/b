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

class Point < ApplicationRecord
  belongs_to :equip
  default_scope -> { order(created_at: :desc) }

  validates :equip_id,            presence: true
  validates :original_thinckness, presence: true
  validates :current_thinckness,  presence: true
  validates :num,                 presence: true
  
end
