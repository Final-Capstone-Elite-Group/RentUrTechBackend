require 'rails_helper'

RSpec.describe EquipmentReservation, type: :model do
  before :all do
    @equipment = create :equipment
    @reservation = create :reservation
  end

  subject { create :equipment_reservation, equipment: @equipment, reservation: @reservation }

  it 'should have an equipment' do
    subject.equipment = nil
    expect(subject).to_not be_valid
  end

  it 'should have a reservation' do
    subject.reservation = nil
    expect(subject).to_not be_valid
  end
end
