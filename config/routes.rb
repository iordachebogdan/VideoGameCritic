Rails.application.routes.draw do
  namespace 'api' do
    resources :games
    resources :consoles
    resources :platforms
    resources :categories
    resources :comments
  end
end
