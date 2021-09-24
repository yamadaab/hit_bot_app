class AddFielderStat < ActiveRecord::Migration[6.1]
  def change
    add_column :fielder_stats, :ops, :string 
  end
end
