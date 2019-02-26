require "rails_helper"

RSpec.describe FoldersController, :type => :controller do
  
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'returns success for users who are not authenticated' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
  describe 'GET #new' do
    it 'renders the index template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'returns success for users who are not authenticated' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
end
