require 'rails_helper'

RSpec.describe EquipmentsController, type: :controller do
  describe 'GET #index' do
    context 'should return all equipments' do
      raise NotImplementedError
    end
  end

  describe 'GET #show' do
    context 'should return the equipment from id' do
      raise NotImplementedError
    end
  end

  describe 'POST #create' do
    context 'should create one equipment' do
      raise NotImplementedError
    end
  end

  describe 'DELETE #destroy' do
    let!(:equipment) { create(:equipment) }
    let(:params) do
      {
        id: equipment.id
      }
    end

    context 'should delete one equipment' do
      it 'success' do
        delete(:destroy, params:)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(204)
        expect(json_response['equipment_destroy']['id']).to eq(equipment.id)
        expect(Equipment.all).to eq([])
      end
    end
  end
end
