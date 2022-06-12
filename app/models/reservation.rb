class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validates :reserved_date, presence: true
  validates :total, presence: true
  validates :city, presence: true
  validate :date_available?, if: :reserved_date

  private

  def date_available?
    all_reserved_dates&.each do |association|
      date_time = association["reserved_date"].to_datetime

      if (outside_date?(date_time) && not_overlapping?(date_time)) || equal_dates?(date_time)
        errors.add(:reserved_date, 'not available')
      end
    end
  end

  def all_reserved_dates
    Reservation.joins(:equipment).where(equipment_id: self.equipment_id).select("reserved_date")
  end

  def outside_date?(date_in_datetime)
    date_plus_duration = date_in_datetime + equipment.duration.days

    reserved_date < date_plus_duration
  end

  def not_overlapping?(date_in_datetime)
    reserved_date_plus_duration = reserved_date + equipment.duration.days

    reserved_date_plus_duration > date_in_datetime
  end

  def equal_dates?(date_in_datetime)
    date_in_datetime == reserved_date
  end
end
