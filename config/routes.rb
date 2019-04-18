require 'sidekiq/web'

Rails.application.routes.draw do
	mount Sidekiq::Web => '/sidekiq'
	root :to => "catch_all#index"
  get '*path', to: 'catch_all#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
