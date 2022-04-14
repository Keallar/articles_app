require 'rails_helper'

describe "Categories show", :type => :request do
  let(:setup_1) { Category.create(name: 'Games') }
  let(:setup_2) { Category.create(name: 'Travel') }

  it "should show category lsiting" do
    get '/categories'
    category_1 = setup_1
    get category_url(category_1)
    expect(response).to be_successful
    category_2 = setup_2
    get category_url(category_2)
    expect(response).to be_successful
  end
  
end
