require 'rails_helper'

describe Api::StoriesController, type: :request do
  describe 'Get #index' do
    it 'リクエストは200となること' do
      get '/api/stories'
      expect(response.status).to eq 200
    end
  end

  describe 'post #create' do
    it 'リクエストは200となること' do
      post '/api/stories', params: { title: 'Test', text: 'test' }
      expect(response.status).to eq 200
    end
  end
end
