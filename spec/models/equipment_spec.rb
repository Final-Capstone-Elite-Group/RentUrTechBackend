require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before :all do
    Equipment.destroy_all
  end

  describe 'Validations' do
    subject { create :equipment }

    context 'title' do
      it 'should have a title' do
        subject.title = nil

        expect(subject).to_not be_valid
      end


      it 'should have a title with more than 2 characters' do
        subject.title = 'No'

        expect(subject).to_not be_valid
      end

      it 'should have a title with less than 25 characters' do
        subject.title = 'N' * 26

        expect(subject).to_not be_valid
      end
    end

    context 'description' do
      it 'should have a description' do
        subject.description = nil

        expect(subject).to_not be_valid
      end

      it 'should have a description with more than 200 characters' do
        subject.description = 'A'*190

        expect(subject).to_not be_valid
      end

      it 'should have a description with more less than 2000 characters' do
        subject.description = 'A'*2001

        expect(subject).to_not be_valid
      end
    end

    it 'should have a review link' do
      subject.review = nil

      expect(subject).to_not be_valid
    end

    it 'should have a date reserved' do
      subject.date_reserved = nil

      expect(subject).to_not be_valid
    end

    it 'should have a duration of the rent' do
      subject.duration = nil

      expect(subject).to_not be_valid
    end

    it 'should have a rent fee' do
      subject.rent_fee = nil

      expect(subject).to_not be_valid
    end

    it 'should have a total amount payable' do
      subject.total_amount_payable = nil

      expect(subject).to_not be_valid
    end

    it 'should have an image' do
      subject.image = nil

      expect(subject).to_not be_valid
    end
  end
end
