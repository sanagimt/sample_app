Rails.application.routes.draw do
  get 'lists/new'
  get 'top' => 'homes#top'
  post 'lists' => 'lists#create' 
    #post：データを新規するHTTPメソッド
    #create：新規作成して保存するアクション
  get 'lists' => 'lists#index'
  get 'lists/:id' => 'lists#show', as: 'list'
    #投稿データを呼び出すルーティングを追加
    #:idでURLを指定。アクション内にparams[:id]と記述して投稿データを取得する。
    #as:～として利用できる
  get 'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  patch 'lists/:id' => 'lists#update' , as: 'update_list'
    #patch：既存データを一部更新するHTTPメソッド
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
