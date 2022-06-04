class Equipment < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
end
