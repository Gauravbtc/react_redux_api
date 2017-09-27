Rails.application.routes.draw do
  #devise_for :m_users

  scope module: 'api' do
    namespace :v1 do
      resources :users
      devise_for :m_users , :controllers => { sessions: 'api/v1/sessions', 
                                             registrations: 'api/v1/registrations',
                                             passwords: 'api/v1/passwords' 
                                           }
    end
  end
 root 'users#index'
end
