class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validate :date_available?

  private

  def date_available?
    equipment&.dates_reserved&.each do |date|
      date_datetime = date.to_datetime
      reserved_datetime = reserved_date.to_datetime
      reserved_date_plus_duration = reserved_datetime + equipment.duration.days

      if date_datetime >= reserved_datetime && date_datetime < reserved_date_plus_duration
        errors.add(:reserved_date, 'is already taken')
      end
    end
  end
end
