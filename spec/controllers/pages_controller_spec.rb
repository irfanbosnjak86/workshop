require "rails_helper"

RSpec.describe PagesController, type: :controller do
  login_user

  describe 'index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end
end