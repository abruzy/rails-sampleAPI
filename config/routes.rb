Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts do
        resources :comments
      end
      resources :users, only: %i[index show updtae]
    end
  end
  scope '/auth' do
    post '/signin', to: 'user_token#create'
    post '/signup', to: 'api/v1/users#create'
  end
end
