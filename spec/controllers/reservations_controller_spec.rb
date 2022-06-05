require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  describe 'POST #create' do
    let!(:user) { create(:user) }
    let!(:equipment) { create(:equipment) }

    let(:params) do
      {
        reservation: {
          total: 200,
          reserved_date: DateTime.now,
          city: 'New York',
          equipment_id: equipment.id
        }
      }
    end

    let(:params2) do
      {
        reservation: {
          total: 200,
          reserved_date: DateTime.new(2022, 6, 5, 4, 5, 6),
          city: 'New York',
          equipment_id: equipment.id
        }
      }
    end

    context 'should create one reservation for the equipment' do
      it 'success' do
        request.headers.merge(valid_headers)
        post(:create, params:)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json_response['total'].to_f).to eq(params[:reservation][:total])
        expect(json_response['city']).to eq(params[:reservation][:city])
        expect(json_response['equipment_id']).to eq(params[:reservation][:equipment_id])
        expect(json_response['user_id']).to eq(user.id)
      end
    end

    context 'should failed creating a reservation for date already reserved' do
      it 'fails' do
        request.headers.merge(valid_headers)
        post(:create, params: params2)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(422)
        expect(json_response['errors']).to eq('Validation failed: Reserved date is already taken')
      end
    end
  end
end
