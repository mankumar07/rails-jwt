require 'rails_helper'

RSpec.describe UsersController, type: :request do
  # describe 'GET /index' do
  #   before do
  #     FactoryBot.create_list(:inventory, 1)
  #     get '/api/v1/inventories'
  #   end

  #   it 'returns all inventories' do
  #     expect(response.status).to eq(200)
  #   end

  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'POST /create' do
    context 'with valid parameters' do
      before do
        post '/users', params:
                              {
                                name: 'abcd',
                                username: 'abcd1',
                                email: 'abcs1@gamil.com',
                                password: '123456',
                                password_confirmation: '123456'
                              } 
      end
      it 'returns the user name' do
        expect(JSON.parse(response.body)['name']).to eq('abcd')
      end

      it 'returns the username' do
        expect(JSON.parse(response.body)['username']).to eq('abcd1')
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/users', params:
                            {
                              name: '',
                              username: '',
                              eamil: '',
                              password: '',
                              password_confirmation: ''
                            } 
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # describe 'PUT /update' do
  #   let!(:inventory) { FactoryBot.create(:inventory) }

  #   before do
  #     put "/api/v1/inventories/#{inventory.id}", params: {
  #       inventory: {
  #         category_name: 'inventory_fisrt2',
  #         description: 'whatever you want'
  #       }
  #     }
  #   end

  #   it 'returns status code 200' do
  #     # byebug
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   let!(:inventory) { FactoryBot.create(:inventory) }

  #   before do
  #     delete "/api/v1/inventories/#{inventory.id}"
  #   end

  #   it 'returns status code 204' do
  #     # byebug
  #     expect(response).to have_http_status(204)
  #   end
  # end
end