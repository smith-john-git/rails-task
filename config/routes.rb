Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/index', to: 'estates#index'
  get '/import', to: 'estates#import'
  post '/upload', to: 'estates#upload'
  get '/', to: redirect('/import')

  get '/404', to: 'static_pages#not_found'
  get '/500', to: 'static_pages#internal_error'
  match '*unmatched', to: redirect('/404'), via: :all
end
