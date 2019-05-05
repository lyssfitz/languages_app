Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}, path: '/', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'create_account' }

  get "/lessons", to: "lessons#index", as: "lessons"
  post "/lessons", to: "lessons#create"
  get "/lessons/new", to: "lessons#new", as: "new_lesson"
  get "/lessons/:id", to: "lessons#show", as: "lesson"
  put "/lessons/:id", to: "lessons#update"
  patch "/lessons/:id", to: "lessons#update"
  delete "/lessons/:id", to: "lessons#destroy"
  get "/lessons/:id/edit", to: "lessons#edit", as: "edit_lesson"
  get '/', to: 'pages#index', as: 'home'
  get '/profile', to:'pages#show', as: 'profile'
end
 