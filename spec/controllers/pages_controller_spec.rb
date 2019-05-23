require 'rails_helper'

describe Api::PagesController, type: :request do
  describe 'Get #index' do
    it 'レコードがなければ404エラーを返すこと' do
      get '/api/stories/1/pages/1'
      expect(response.status).to eq 404
    end
  end

  describe 'Post #create' do
    it 'storyが作成されていなければリクエストは422エラーを返すこと' do
      post '/api/stories/1/pages/1/next', params: { page: { page: 'test', name: 'hoge' } }
      expect(response.status).to eq 422
    end
  end
end
