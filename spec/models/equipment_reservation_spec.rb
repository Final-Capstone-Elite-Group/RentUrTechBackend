require 'rails_helper'

RSpec.describe EquipmentReservation, type: :model do
  subject { create :equipment_reservation }

  it 'should have an equipment' do
    subject.equipment = nil
    expect(subject).to_not be_valid
  end

  it 'should have a reservation' do
    subject.reservation = nil
    expect(subject).to_not be_valid
  end
end
