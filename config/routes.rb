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
        resources :lectures do
          resources :blocks, shallow: true do
            scope module: :blocks do
              with_options only: [:edit, :update] do |assoc|
                assoc.resource :code
                assoc.resource :file
                assoc.resource :photo
                assoc.resource :text
                assoc.resource :video
              end
            end
          end
        end
      end
    end
  end

  root to: 'main#index'
end
