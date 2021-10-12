class CreateNotifingStats < ActiveRecord::Migration[6.1]
  def change
    create_table :notifing_stats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.string :kind
      t.integer :target
      t.integer :previous_stat
      t.integer :latest_updated_value
      t.boolean :mail, default: false, null: false

      t.timestamps
    end
  end
end
