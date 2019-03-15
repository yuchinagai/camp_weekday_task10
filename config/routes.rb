Rails.application.routes.draw do
  root 'areas#index'
  get '/areas/search', to: 'areas#new'
  post '/areas/search', to: 'areas#create' #createアクションのビューでedit.html.erbを呼び出す。
  post '/areas',  to: 'areas#update' #introductionも含めて保存するアクション
  resources :areas
end
