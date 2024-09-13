class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :employee_id, presence: true, uniqueness: true, format: { with: /\A\d{8}\z/, message: "must be exactly 8 digits" }
  validates :department, presence: true
  validates :staff_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶ一-龥々〆〤ー]+\z/, message: 'is invalid. Input full-width characters' }
  validates :staff_name_kana, presence: true, 
  format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana character' }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'must contain both letters and numbers' },if: :password_required?

  private

  # 新規作成時のみバリデーションを適用するための条件メソッド
  def password_required?
    new_record?
  end
end
