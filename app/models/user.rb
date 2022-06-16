class User < ApplicationRecord
  has_secure_password

  has_many :reservations, dependent: :destroy
  has_many :equipments, dependent: :destroy

  has_one_attached :image

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, length: { minimum: 6 }

  enum role: {
    user: 'user',
    admin: 'admin'
  }
end
