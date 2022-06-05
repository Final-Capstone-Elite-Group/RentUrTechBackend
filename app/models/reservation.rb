class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validate :date_available?

  private

  def date_available?
    equipment&.date_reserved&.each do |date|
      if DateTime.parse(date) >= reserved_date && DateTime.parse(date) < reserved_date + equipment.duration.days
        errors.add(:reserved_date, 'is already taken')
      end
    end
  end
end
