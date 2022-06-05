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
  end

  describe 'DELETE #destroy' do
    let!(:user) { create(:user) }
    let!(:another_user) { create(:user) }
    let!(:equipment) { create(:equipment) }
    let!(:reservation) { create(:reservation, equipment:, user:) }
    let!(:another_reservation) { create(:reservation) }

    let(:params) do
      {
        id: reservation.id
      }
    end

    context 'should destroy one reservation for the equipment' do
      it 'success' do
        request.headers.merge(valid_headers)
        delete(:destroy, params:)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json_response['data']).to eq('Reservation destroyed successfully')
        expect(Reservation.all.count).to eq(1)
        expect(Reservation.last.id).to eq(another_reservation.id)
      end
    end

    context 'should not destroy the reservation for the equipment if its not the user who created it' do
      it 'success' do
        request.headers.merge('Authorization' => token_generator(another_user.id))
        delete(:destroy, params:)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(422)
        expect(json_response['data']).to eq('Not allowed to destroy this Reservation')
        expect(Reservation.all.count).to eq(2)
      end
    end
  end
end
