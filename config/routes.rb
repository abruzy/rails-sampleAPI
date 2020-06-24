Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i[show updtae]
      scope '/auth' do
        post '/signin', to: 'user_token#create'
        post '/signup', to: 'users#create'
      end
    end
  end
end
