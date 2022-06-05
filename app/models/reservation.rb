class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  after_create

  validate :date_available?

  private

  def date_available?
    equipment&.dates_reserved&.each do |date|
      if date.to_datetime >= reserved_date.to_datetime && date.to_datetime < reserved_date.to_datetime + equipment.duration.days
        errors.add(:reserved_date, 'is already taken')
      end
    end
  end
end
