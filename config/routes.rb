require_relative '../config/route_constraints/subdomain'

Rails.application.routes.draw do
  constraints subdomain: '' do
    devise_for :users
    scope module: :main do
      resources :companies, except: [:show]
    end
  end

  constraints(RouteConstraint::Subdomain.new) do
    scope module: :domain do

      resources :courses do
        resources :lectures, except: [:index], shallow: true do
          resources :blocks, shallow: true
        end
      end

      namespace :block do
        resources :texts, only: [:show, :edit, :update]
      end
    end
  end

  root to: 'main#index'
end
