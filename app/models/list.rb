class List < ApplicationRecord
    has_one_attached :image
    #Listモデルに画像を扱うためのimageカラム追記（されたかのよう）
end
