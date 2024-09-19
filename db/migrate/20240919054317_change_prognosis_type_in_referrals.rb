class ChangePrognosisTypeInReferrals < ActiveRecord::Migration[7.0]
  def up
    change_column :referrals, :prognosis, :string
   end
   
   def down
    change_column :referrals, :prognosis, :integer
   end
end
