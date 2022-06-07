require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Validations' do
    subject { create :reservation }

    it 'should have a total' do
      subject.total = nil
      expect(subject).to_not be_valid
    end

    it 'should have a reserved_date' do
      subject.reserved_date = nil
      expect(subject).to_not be_valid
    end

    it 'should have a city' do
      subject.city = nil
      expect(subject).to_not be_valid
    end
  end
end
