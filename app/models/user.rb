# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  remember_digest :string
#  admin           :boolean          default(FALSE)
#

class User < ApplicationRecord
    has_many      :devices, dependent: :destroy
    attr_accessor :remember_token
    validates     :name, presence: true, length: { maximum: 50 }

    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format:   { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    mount_uploader :point_adrr,  PointUploader
    mount_uploader :device_adrr, DeviceUploader
    mount_uploader :equip_adrr,  EquipUploader
    # 返回指定字符串的哈希摘要
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # 返回一个随机令牌
    def User.new_token
        SecureRandom.urlsafe_base64
    end

    # 为了持久保存会话，在数据库中记住用户
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    # 如果指定的令牌和摘要匹配，返回 true
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # 忘记用户
    def forget
        update_attribute(:remember_digest, nil)
    end

    def feed
        Device.where("user_id = ?", id)
    end
        
end
