class List < ApplicationRecord
    has_one_attached :image
    #Listモデルに画像を扱うためのimageカラム追記（されたかのよう？）

    validates :title, presence: true
    validates :body, presence: true
    validates :image, presence: true
    #validatesで項目指定⇒presence（存在）をチェック
    #入力が無ければ投稿できない状態にする
    #imageの処理は、active_storage導入前に画像添付がない場合の対処。presenceをチェックしても問題なし。

end
