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

class Pgrade < ApplicationRecord
	belongs_to :equip
	validates  :equip_id,        presence: true
  	validates  :point_num,        presence: true
  	validates  :severe_point,    presence: true
  	validates  :minor_point,     presence: true
end
