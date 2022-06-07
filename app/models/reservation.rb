class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validate :date_available?
  validates :total, presence: true
  validates :city, presence: true
  validates :reserved_date, presence: true

  private

  def date_available?
    equipment&.dates_reserved&.each do |date|
      date_datetime = date.to_datetime
      reserved_datetime = reserved_date.to_datetime
      previous_date_plus_duration = date_datetime + equipment.duration.days + 1.day
      reserved_date_plus_duration = reserved_datetime + equipment.duration.days

      if (previous_date_plus_duration > reserved_datetime && reserved_date_plus_duration > date_datetime) ||
         date_datetime == reserved_datetime
        errors.add(:reserved_date, 'is already taken')
        return
      end
    end
  end
end
