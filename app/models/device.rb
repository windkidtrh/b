# == Schema Information
#
# Table name: devices
#
#  id           :integer          not null, primary key
#  name         :string
#  introduction :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  num          :integer
#

class Device < ApplicationRecord
  has_many   :equips,       dependent: :destroy
  belongs_to :user
  validates  :user_id,      presence: true
  validates  :num,          presence: true
  validates  :name,         presence: true, length: { maximum: 20 }
  validates  :introduction, presence: true, length: { maximum: 140 }

  default_scope -> { order(created_at: :desc) }

  def feed_equip
    Equip.where("device_id = ?", id)
  end
    

end
