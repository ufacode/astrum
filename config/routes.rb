Rails.application.routes.draw do
  constraints subdomain: '' do
    devise_for :users
    scope module: :main do
      resources :companies
    end
    root 'main/main#index'
  end

  constraints subdomain: /.*/ do
    scope module: :domain do
      resources :companies, only: [:index, :show]
    end
    root 'domain/companies#index'
  end
end
