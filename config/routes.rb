Rails.application.routes.draw do
  #devise_for :m_users

  scope module: 'api' do
    namespace :v1 do
      resources :users
      devise_for :m_users
    end
  end
 root 'users#index'
end
