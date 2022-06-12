require 'rails_helper'

RSpec.describe EquipmentsController, type: :controller do
  describe 'GET #index' do
    let!(:equipments) { create_list(:equipment, 10) }

    context 'should return all equipments' do
      it 'success' do
        get(:index)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json_response['data'].count).to eq(10)
        expect(json_response['data'].first['attributes']['id']).to eq(equipments.last.id)
      end
    end
  end

  describe 'GET #show' do
    context 'should return the equipment from id' do
      let!(:equipment) { create(:equipment) }

      let(:params) do
        {
          id: equipment.id
        }
      end

      it 'success' do
        get(:show, params:)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json_response['data']['attributes']['id']).to eq(equipment.id)
        expect(json_response['data']['attributes']['title']).to eq(equipment.title)
        expect(json_response['data']['attributes']['description']).to eq(equipment.description)
      end

      it 'fails' do
        get(:show, params: { id: -1 })

        expect(response.status).to eq(404)
      end
    end
  end

  describe 'POST create' do
    let!(:user) { create(:user, role: :admin) }

    let(:params) do
      {
        title: FFaker::Lorem.characters(10),
        description: FFaker::Lorem.characters(200),
        review: FFaker::Lorem.word,
        duration: FFaker::Random.rand(60),
        rent_fee: FFaker::Random.rand(1000),
        total_amount_payable: FFaker::Random.rand(1000),
        image: Rack::Test::UploadedFile.new('spec/assets/test.png', 'image/png')
      }
    end

    context 'Create an equipment' do
      it 'should be successful if proper parameters are sent' do
        request.headers.merge(valid_headers)
        post(:create, params:)
        json_response = JSON.parse(response.body)
        equipment_db = Equipment.last

        expect(response.status).to eq(201)
        expect(json_response['data']['attributes']['title']).to eq(equipment_db.title)
        expect(json_response['data']['attributes']['description']).to eq(equipment_db.description)
        expect(json_response['data']['attributes']['review']).to eq(equipment_db.review)
        expect(json_response['data']['attributes']['duration']).to eq(equipment_db.duration)
      end

      it 'should fail if unproper parameters are sent' do
        params[:title] = nil
        request.headers.merge(valid_headers)
        post(:create, params:)

        expect(response.status).to eq(422)
        expect(response.body).to include("Title can't be blank")
        expect(response.body).to include('Title is too short (minimum is 3 characters)')
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create(:user, role: :admin) }
    let!(:equipment) { create(:equipment) }
    let!(:another_equipment) { create(:equipment) }

    let(:params) do
      {
        id: equipment.id
      }
    end

    context 'should delete one equipment' do
      it 'success' do
        request.headers.merge(valid_headers)
        delete(:destroy, params:)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json_response['message']).to eq('Equipment succesfully deleted')
        expect(Equipment.all.count).to eq(1)
        expect(Equipment.first.id).to eq(another_equipment[:id])
      end
    end
  end
end
