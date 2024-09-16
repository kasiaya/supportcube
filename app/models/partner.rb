class Partner < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :institution_category
  has_many :referrals

  #医療機関名を空で保存できないようにする
  validates :institution_name, presence: true

  #医療機関分類の選択が「---」の時は保存できないようにする
  validates :institution_category_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
