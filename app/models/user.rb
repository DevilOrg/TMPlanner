class User < ApplicationRecord

  authenticates_with_sorcery!

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { minimum: 8 }

  after_initialize on: :create do
    self.password = SecureRandom.hex(8) if password.blank?
  end

end
