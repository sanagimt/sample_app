class ListsController < ApplicationController
  def new
    @list = List.new
    #インスタンス変数：コントローラー⇒Viewでデータの受け渡しができる、@マークをつけて定義
    #ローカル変数 ：受け渡しできない、何もつけない

  end

  def create
    #データを受け取り新規するためのインスタンス作成
    list = List.new(list_params) #今回はローカル変数（Viewに不要）
    #データをデータベースに保存するためのsaveメソッド実行
    list.save
    #トップ画面へのリダイレクト
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end

  private #ここから下はcontrollerの中でしか呼び出せない（境界線）。データベースにアクセスするアクション、viewに表示するアクション等を下に書くとエラーが出る。
  # ストロングパラメータ：マスアサインメント脆弱性を防ぐ仕組み
  # ※マスアサインメント脆弱性：悪意のあるユーザーが改竄したデータを保存してしまうシステムの弱さ。
  def list_params
    params.requre(:list).permit(:title, :body)
    # params:formからのデータが入るところ
    # require:送られたデータ中からモデル名を指定し（:list）、データを絞り込む
    # permit：絞り込んだデータから、保存を許可するカラムを指定
  end

end
