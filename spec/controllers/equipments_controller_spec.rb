require 'rails_helper'

RSpec.describe EquipmentsController, type: :request do
  describe 'GET #index' do
    let!(:equipments) { create_list(:equipment, 10) }

    context 'should return all equipments' do
      it 'success' do
        get(equipments_path)
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(200)
        expect(json_response.count).to eq(10)
        expect(json_response.first['id']).to eq(equipments.last.id)
      end
    end
  end

  describe 'GET #show' do
    context 'should return the equipment from id' do
      # raise NotImplementedError
    end
  end

  describe 'POST create' do
    let!(:user) { create(:user) }
    let!(:auth_response) { Auth::AuthenticateUser.new(user.username, user.password).call }
    let(:params) do
      {
        title: FFaker::Lorem.characters(10),
        description: FFaker::Lorem.characters(200),
        review: FFaker::Lorem.word,
        date_reserved: Date.today,
        duration: FFaker::Random.rand(60),
        rent_fee: FFaker::Random.rand(1000),
        total_amount_payable: FFaker::Random.rand(1000),
        image: Rack::Test::UploadedFile.new('spec/assets/test.png', 'image/png')
      }
    end

    context 'Create an equipment' do
      it 'should be successful if proper parameters are sent' do
        post(equipments_path, params:, headers: { 'Authorization' => auth_response[:message][:auth_token] })
        json_response = JSON.parse(response.body)
        equipment_db = Equipment.last

        expect(response.status).to eq(201)
        expect(json_response['title']).to eq(equipment_db.title)
        expect(json_response['description']).to eq(equipment_db.description)
        expect(json_response['review']).to eq(equipment_db.review)
        expect(json_response['duration']).to eq(equipment_db.duration)
      end

      it 'should fail if unproper parameters are sent' do
        params[:title] = nil
        post(equipments_path, params:, headers: { 'Authorization' => auth_response[:message][:auth_token] })
        json_response = JSON.parse(response.body)

        expect(response.status).to eq(400)
        expect(json_response['errors'].count).to eq(2)
        expect(json_response['errors']).to include("Title can't be blank")
        expect(json_response['errors']).to include('Title is too short (minimum is 3 characters)')
      end
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
        delete(equipment_path(id: params[:id]), params:)
        json_response = JSON.parse(response.body)


        expect(response.status).to eq(200)
        expect(json_response['message']).to eq('Equipment succesfully deleted')
        expect(Equipment.all).to eq([])
      end
    end
  end
end
