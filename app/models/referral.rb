class Referral < ApplicationRecord
  belongs_to :staff
  belongs_to :doctor
  belongs_to :partner

end
