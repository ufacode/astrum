Rails.application.routes.draw do
  constraints subdomain: '' do
    scope :main do
      devise_for :users
    end
    root 'main/main#index'
  end
  constraints subdomain: '*' do
    scope :domain do
      root 'companies#index'
      resources :companies
    end
  end
end
