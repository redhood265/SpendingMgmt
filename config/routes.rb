Rails.application.routes.draw do
  root 'buy_items#index'
  resources :buy_items do
    collection do
      get 'log_view'
      get 'chart_view'
    end
  end
end
