Rails.application.routes.draw do
  namespace 'api' do
    resources :games
    resources :consoles
  end
end
