Rails.application.routes.draw do
  scope module: 'api/v1', defaults: { format: 'json' } do
    resources :artists, except: :update, shallow: true do
      resources :albums, only: %i[index create]
      resources :tracks, only: %i[index]
    end
    resources :albums, except: :update, shallow: true do
      resources :tracks, only: %i[index create]
    end
    resources :tracks, except: :update
  end

  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
