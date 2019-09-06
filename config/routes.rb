Rails.application.routes.draw do
  get 'sales/new', as: 'new'
  post 'sales/create', as: 'sales'
  get 'sales/done', as: 'done'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
