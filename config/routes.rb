Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  # devise_for :users, path: '/', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'create_account' }
end
 