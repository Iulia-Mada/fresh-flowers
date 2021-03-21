Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :products, except: :destroy
      resources :orders
      resources :order_items, only: [:update, :destroy]
    end
  end

  get '*path', to: 'home#fallback_index_html', constraints: ->(request) do
    !request.xhr? && request.format.html?
  end

  get '/apidocs' => redirect('/redoc.html')
  resources :apischema, only: :index
end
