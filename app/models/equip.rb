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

class Equip < ApplicationRecord
  has_many   :points,       dependent: :destroy
  belongs_to :device
  default_scope -> { order(created_at: :desc) }

  validates  :device_id,        presence: true
  validates  :num,              presence: true
  validates  :specie,           presence: true, length: { maximum: 20 }
  validates  :name,             presence: true, length: { maximum: 20 }
  validates  :manufacturer,     presence: true, length: { maximum: 40 }
  validates  :material,         presence: true, length: { maximum: 20 }
  validates  :specification,    presence: true, length: { maximum: 40 }
  
  def feed_point
    Point.where("equip_id = ?", id)
  end
end
