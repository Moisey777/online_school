Rails.application.routes.draw do
  namespace :admin do
    get 'teachers/index'
    get 'teachers/new'
    get 'teachers/create'
    get 'teachers/edit'
    get 'teachers/update'
    get 'teachers/destroy'
  end
  namespace :admin do
  	root to: 'main#index'
    get 'main/index'
    resources :teachers, exept: :show

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
