require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = User.create(  name: 'abcd',
                          username: 'abcd1',
                          email: 'abcs1@gamil.com',
                          password: '123456',
                          password_confirmation: '123456'
                        )
    sign_in @user
  end
  describe 'GET /index' do
    before do
      get :index
    end
    it 'returns all users' do
      expect(response.status).to eq(200)
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    before do
      get :show, params: {_username:@user.username}
    end
    it 'returns all users' do
      expect(response.status).to eq(200)
    end
    it 'returns the username' do
      expect(JSON.parse(response.body)['username']).to eq('abcd1')
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      before do
        post 'create', params:
                              {
                                name: 'abcd2',
                                username: 'abcd12',
                                email: 'abcs12@gamil.com',
                                password: '123456',
                                password_confirmation: '123456'
                              }
      end
      it 'returns the user name' do
        expect(JSON.parse(response.body)['name']).to eq('abcd2')
      end

      it 'returns the username' do
        expect(JSON.parse(response.body)['username']).to eq('abcd12')
      end

      it 'returns a created status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      before do
        post 'create', params:
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

  describe 'PUT /update' do
    before do
      put :update, params: {  name: 'abcdererr',
                              _username: 'abcd1',
                              email: 'abcs1@gamil.com',
                              password: '123456',
                              password_confirmation: '123456'
                            }
    end

    it 'returns status code 204' do
      expect(response.status).to eq(204)
    end
  end

  describe 'DELETE /destroy' do
    before do
      delete :destroy, params: {_username: 'abcd1'}
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end