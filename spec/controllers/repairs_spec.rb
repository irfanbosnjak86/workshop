require "rails_helper"

RSpec.describe RepairsController, type: :controller do
  login_user

  describe 'index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'create' do
    it 'has a 302 status code and creates new repair' do
      repair_params = FactoryGirl.attributes_for(:repair)

      expect { post :create, repair: repair_params }.to change(Repair, :count).by(1) 
      expect(response.status).to eq(302)
    end
  end

  describe 'show' do
    it 'has a 200 status code' do
      get :show
      expect(response.status).to eq(200)
    end
  end
end