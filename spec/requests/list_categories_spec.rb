require 'rails_helper'

RSpec.describe "ListCategories", type: :request do
  describe "GET /list_categories" do
    it "works! (now write some real specs)" do
      get list_categories_index_path
      expect(response).to have_http_status(200)
    end
  end
end
