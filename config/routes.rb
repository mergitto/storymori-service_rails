Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    get '/stories' => 'stories#index'
    post '/stories' => 'stories#create'

    get '/stories/:story_id/pages/:page_id' => 'pages#index'
    post '/stories/:story_id/pages/:parent_id/next' => 'pages#create'
  end
end
