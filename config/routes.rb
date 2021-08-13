Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/index', to: 'estates#index'
  get '/import', to: 'estates#import'
  post '/upload', to: 'estates#upload'
  get '/', to: redirect('/import')
end
