require 'rails_helper'
RSpec.describe WorkshopsController, type: :controller do

  login_user

  let(:workshop) {FactoryGirl.create(:workshop)}

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
    it 'has a 302 status code and creates new workshop' do
      workshop_params = FactoryGirl.attributes_for(:workshop)

      expect {post :create, params: { workshop: workshop_params }}.to change { Workshop.count }.by(1)
      expect(response.status).to eq(302)
    end
  end

  describe 'show' do
    it 'has a 200 status code' do
      get :show, {id: workshop.id}
      expect(response.status).to eq(200)
    end
  end

  describe 'edit' do
    it 'has a 200 status code' do
      get :edit, { id: workshop.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'update' do
    it 'has a 302 status code and updates existing workshop' do
      put :update, id: workshop.id, workshop: { description: "Edited"}

      expect(response.status).to eq(302)
      workshop.reload
      expect(workshop.description).to eq("Edited")
    end
  end

  describe 'delete' do
    it 'has a 302 status code' do
      delete :destroy, {id: workshop.id}
      expect(response.status).to eq(302)
    end

    it "delete's the workshop" do
      workshop.reload
      expect { delete :destroy, id: workshop.id }.to change { Workshop.count }.by(-1)
    end
  end

end
