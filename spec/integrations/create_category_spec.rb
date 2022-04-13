require 'rails_helper'

describe 'Category new and create', :type => :request do
  let(:create_category) { Category.create(name: 'Sports') }

  it 'get new category form and create category' do
    get '/categories/new'
    expect(response).to have_http_status(:success)
    expect {
      post '/categories', params: {category: { name: 'Traveling' } }
    }.to change{ Category.count }.by(1)
    expect(response).to redirect_to(assigns(:category))
    follow_redirect!
    expect(response).to render_template(:show)
  end

  let(:create_error_category) { Category.create(name: '') }

  it 'get new category form and reject invalid category submission' do
    get '/categories/new'
    expect(response).to have_http_status(:success)
    expect {
      post '/categories', params: {category: { name: '' } }
    }.to change{ Category.count }.by(0)
  end
end
