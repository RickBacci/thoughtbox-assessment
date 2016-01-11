class User < ActiveRecord::Base
  has_secure_password
  has_many :links

  validates_confirmation_of :password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
