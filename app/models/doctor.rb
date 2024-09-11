class Doctor < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :specialty
end
