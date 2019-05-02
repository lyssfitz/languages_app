Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}, path: '/', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'create_account' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/lessons", to: "lessons#index", as: "lessons"
  post "/lessons", to: "lessons#create"
  get "/lessons/new", to: "lessons#new", as: "new_lesson"
  get "/lessons/:id", to: "lessons#show", as: "lesson"
  put "/lessons/:id", to: "lessons#update"
  patch "/lessons/:id", to: "lessons#update"
  delete "/lessons/:id", to: "lessons#destroy"
  get "/lessons/:id/edit", to: "lessons#edit", as: "edit_lesson"
end
 