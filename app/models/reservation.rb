class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validate :date_available?
  validates :total, presence: true
  validates :city, presence: true
  validates :reserved_date, presence: true

  private

  def date_available?
    return if reserved_date.nil?

    equipment&.dates_reserved&.each do |date|
      date_datetime = date.to_datetime
      reserved_datetime = reserved_date.to_datetime
      date_plus_duration_plus_1_day = date_datetime + equipment.duration.days + 1.day
      reserved_date_plus_duration = reserved_datetime + equipment.duration.days

      if (reserved_datetime < date_plus_duration_plus_1_day && reserved_date_plus_duration > date_datetime) ||
         date_datetime == reserved_datetime
        errors.add(:reserved_date, 'not available')
        return
      end
    end
  end
end
