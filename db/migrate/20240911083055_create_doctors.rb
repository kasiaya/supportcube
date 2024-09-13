class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string     :doctor_name         , null: false
      t.integer    :specialty_id        , null: false
      t.timestamps
    end
  end
end
