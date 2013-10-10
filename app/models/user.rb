class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  has_secure_password

  validates :password, :password_confirmation, presence: true, on: :create
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, :email, length: { maximum: 255 }
  validates :email,
      uniqueness: { case_sensitive: false },
      presence: true,
      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
