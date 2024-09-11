class Partner < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :institution_category
end
