class Doctor < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :specialty


  #医療機関名を空で保存できないようにする
  validates :doctor_name, :string, presence: true

  #診療科の選択が「---」の時は保存できないようにする
  validates :specialty_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
