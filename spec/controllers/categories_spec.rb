require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET /index' do
    it "should get index" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it "should get new" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'should show category' do
      @category = Category.create(name: 'Sports')
      get :show, params: { id: @category.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'should create category' do
      post :create, params: { category: { name: 'Traveling' } }
      expect(response).to redirect_to(assigns(:category))
    end


  end
end
