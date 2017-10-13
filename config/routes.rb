Rails.application.routes.draw do
  #devise_for :m_users

  scope module: 'api' do
    namespace :v1 do
      get 'login_user' ,to: 'api#login_user'
      get 'get_role', to: 'api#get_role'
      resources :users
      devise_for :m_users , :controllers => { sessions: 'api/v1/sessions',
                                             registrations: 'api/v1/registrations',
                                             passwords: 'api/v1/passwords'
                                           }
    end
  end
 root 'users#index'
end
