class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string     :institution_name         , null: false
      t.integer    :institution_category_id  , null: false
      t.timestamps
    end
  end
end
