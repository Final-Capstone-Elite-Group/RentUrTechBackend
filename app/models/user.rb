class User < ApplicationRecord
  has_secure_password

  has_many :reservations, dependent: :destroy
  has_one_attached :image

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
end
