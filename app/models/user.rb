class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true

  def jwt!
    update(jti: SecureRandom.hex(20))
    self.jti
  end
end