Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}, path: '/', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'create_account' }
  get '/', to: 'pages#index', as: 'home'
end
 