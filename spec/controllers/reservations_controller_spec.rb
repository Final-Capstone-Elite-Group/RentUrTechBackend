require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  describe 'POST #create' do
    let!(:user) { create(:user) }
    let!(:equipment) { create(:equipment, duration: 1) }
    let!(:reserved_equipment) { create(:equipment, duration: 1, dates_reserved: [DateTime.new(2022, 6, 5, 4, 5, 6)]) }

    let(:params) do
      {
        reservation: {
          total: 200,
          reserved_date: DateTime.new(2022, 6, 5, 4, 5, 6),
          city: 'New York',
          equipment_id: equipment.id
        }
      }
    end

    let(:params2) do
      {
        reservation: {
          total: 200,
          reserved_date: DateTime.new(2022, 6, 7, 4, 5, 6),
          city: 'New York',
          equipment_id: reserved_equipment.id
        }
      }
    end

    let(:params3) do
      {
        reservation: {
          total: 200,
          reserved_date: DateTime.new(2022, 6, 5, 4, 5, 6),
          city: 'New York',
          equipment_id: reserved_equipment.id
        }
      }
    end

    context 'should create one reservation for the equipment' do
      it 'success' do
        request.headers.merge(valid_headers)
        post(:create, params:)
        json_response = JSON.parse(response.body)
        equipment = Equipment.find(json_response['equipment_id'])

        expect(response.status).to eq(200)
        expect(json_response['total'].to_f).to eq(params[:reservation][:total])
        expect(json_response['city']).to eq(params[:reservation][:city])
        expect(json_response['equipment_id']).to eq(params[:reservation][:equipment_id])
        expect(json_response['user_id']).to eq(user.id)
        expect(equipment.dates_reserved.count).to eq(1)
        expect(equipment.dates_reserved.first.to_datetime).to eq(params[:reservation][:reserved_date].to_datetime)
      end
    end

    context 'should create another reservation for the same equipment on a different date' do
      it 'success' do
        request.headers.merge(valid_headers)
        post(:create, params: params2)
        json_response = JSON.parse(response.body)
        equipment = Equipment.find(json_response['equipment_id'])

        expect(response.status).to eq(200)
        expect(equipment.dates_reserved.count).to eq(2)
      end
    end

    context 'should failed creating a reservation for date already reserved' do
      it 'fails' do
        request.headers.merge(valid_headers)
        post(:create, params: params3)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(422)
        expect(json_response['errors']).to eq('Validation failed: Reserved date is already taken')
      end
    end
  end

  describe 'GET #Index' do
    let!(:user) { create(:user) }
    let!(:reservations) { create_list(:reservation, 10, user:) }

    context 'should retrieve all the reservations for the current user' do
      it 'success' do
        request.headers.merge(valid_headers)
        get(:index)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json_response['data'].length).to eq(10)
        expect(json_response['data'].last['attributes']['id']).to eq(user.reservations.order(created_at: :desc).last.id)
        expect(json_response['data'].last['attributes']['total'].to_f).to eq(user.reservations.order(created_at: :desc).last.total)
        expect(json_response['data'].last['attributes']['city']).to eq(user.reservations.order(created_at: :desc).last.city)
      end
    end
  end

end
