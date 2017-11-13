require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  login_user

  let(:workshop) {FactoryGirl.create(:workshop)}
  let(:item) {FactoryGirl.create(:item)}

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
    it 'has a 302 status code and creates new item' do
      item_params = FactoryGirl.attributes_for(:item)

      expect {post :create, params: { item: item_params.merge(workshop_id: workshop.id) }}.to change { Item.count }.by(1)
      expect(response.status).to eq(302)
    end
  end

  describe 'show' do
    it 'has a 200 status code' do
      get :show, {id: item.id}
      expect(response.status).to eq(200)
    end
  end

  describe 'edit' do
    it 'has a 200 status code' do
      get :edit, { id: item.id }
      expect(response.status).to eq(200)
    end
  end

  describe 'update' do
    it 'has a 302 status code and updates existing item' do
      put :update, id: item.id, item: { status: "Finished"}

      expect(response.status).to eq(302)
      item.reload
      expect(item.status).to eq("Finished")
    end
  end

  describe 'delete' do
    it 'has a 302 status code' do
      delete :destroy, {id: item.id}
      expect(response.status).to eq(302)
    end

    it "delete's the item" do
      item.reload
      expect { delete :destroy, id: item.id }.to change { Item.count }.by(-1)
    end
  end

end
