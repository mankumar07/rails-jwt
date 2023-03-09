require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'GET /Login' do
    before do
      @user = User.create( name: 'abcd',
                           username: 'abcd1',
                           email: 'abcs1@gamil.com',
                           password: '123456',
                           password_confirmation: '123456'
                          )
      get :login, params: {email: @user.email,password: @user.password}
    end
    it 'returns Login status' do
      expect(response.status).to eq(200)
    end
    it 'returns login token' do
      expect(JSON.parse(response.body)['token']).to be_kind_of(String)
    end
    it 'returns the username' do
      expect(JSON.parse(response.body)['username']).to eq('abcd1')
    end
    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end

end