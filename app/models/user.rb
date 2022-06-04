class User < ApplicationRecord
  has_secure_password

  has_many :reservations, dependent: :destroy
  has_many :equipments

  has_one_attached :image

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, uniqueness: true

  enum role: {
    user: 'user',
    admin: 'admin'
  }
end
