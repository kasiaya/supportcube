class Referral < ApplicationRecord
  belongs_to :staff
  belongs_to :doctor
  belongs_to :partner

  enum :gender,        { male: 0, female: 1 }
  enum :history,       { returning: 0, new_entry: 1 }
  enum :purpose,       { rehabilitation: 0, respite: 1, other: 2 }
  enum :insurance,     { no_insurance: 0, supportone: 1, supporttwo: 2, careone: 3, caretwo: 4, carethree: 5, carefour: 6, carefive: 7 }
  enum :status,        { hearing: 0, pending: 1, waiting: 2, canceled: 3 }
  enum :determination, { preparing: 0, requested: 1, declined: 2, adjusting: 3, adjusted: 4, accepted: 5 }

  validates :patient_name,  presence: true
  validates :age,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 130 }
  validates :gender,        presence: true
  validates :history,       presence: true
  validates :purpose,       presence: true
  validates :insurance,     presence: true
  validates :status,        presence: true
  validates :determination, presence: true
  validates :staff,         presence: true
  validates :doctor,        presence: true
  validates :partner,       presence: true
end
