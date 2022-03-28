require 'rails_helper'

describe 'Category new and create', :type => :request do
  # let(:create_category) { Category.create(name: 'Sports') }

  it 'get new category form and create category' do
    get '/categories/new'
    expect(response).to have_http_status(:success)
    # expect { create_category }.to change { Category.count }.by(1)
    # expect(response.body).to eq('Traveling')
    post '/categories', params: { category: { name: 'Traveling' } }
    expect(assigns(:categories)).to eq 1
    expect(response).to redirect_to(assigns(:category))
    # response.should redirect_to("/categories/#{Category.count}")
    # expect(response).to eq('Traveling')
  end

  it 'get new category form and reject invalid category submission' do
    get 'categories/new'
    expect(response)
  end
end
