Rails.application.routes.draw do
  get '/', to: 'areas#index'
  get '/areas/search', to: 'areas#new'
  post '/areas/search', to: 'areas#create' #createアクションのビューでedit.html.erbを呼び出す。
  resources :areas
end
