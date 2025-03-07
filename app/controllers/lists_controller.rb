class ListsController < ApplicationController
  def new
    #新規作成のフォームを表示するためのインスタンス
    @list = List.new
    #インスタンス変数：コントローラー⇒Viewでデータの受け渡しができる、@マークをつけて定義
    #ローカル変数 ：受け渡しできない、何もつけない

  end

  def create
    #データを受け取り新規保存するためのインスタンス作成
    @list = List.new(list_params) 
    #データをデータベースに保存するためのsaveメソッド実行
    if @list.save
    #保存できる場合、保存したデータの詳細画面へのリダイレクト
      redirect_to list_path(@list.id)
    else
    #保存できなければ、新規投稿ページを再表示
    #render:同じコントローラ内の別アクションのViewを表示
      render :new
    end
  end

  def index
    #データベース内の保存データを全取得するためのインスタンス
    @lists = List.all
    #インスタンス変数（viewファイルで情報表示するため）
  end 

  def show
    #引数を受け取り、URLの:idのレコードを取得するためのインスタンス
    @list = List.find(params[:id])
    #レコード1件のみ取得するため単数形
  end

  def edit
    #説明はshow参照
    @list = List.find(params[:id])
  end

  def update
    #引数を受け取り、レコード取得
    list = List.find(params[:id])
    #データを更新するためのupdateメソッド
    list.update(list_params)
    #一覧へのリダイレクト
    redirect_to list_path(list.id)
  end

  def destroy
    #データを1件取得
    list = List.find(params[:id])
    #取得したデータを削除
    list.destroy
    #投稿一覧へリダイレクト
    redirect_to '/lists'
  end

  private
  #ここから下はcontrollerの中でしか呼び出せない（境界線）。データベースにアクセスするアクション、viewに表示するアクション等を下に書くとエラーが出る。
  
  # ストロングパラメータ：マスアサインメント脆弱性を防ぐ仕組み
  # ※マスアサインメント脆弱性：悪意のあるユーザーが改竄したデータを保存してしまうシステムの弱さ。
  def list_params
    params.require(:list).permit(:title, :body, :image)
    # params:formからのデータが入るところ
    # require:送られたデータ中からモデル名を指定し（:list）、データを絞り込む
    # permit：絞り込んだデータから、保存を許可するカラムを指定
  end

end
