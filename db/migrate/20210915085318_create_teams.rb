class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name, index: { unique: true }, null: false
      t.string :short_name

      t.timestamps
    end
  end
end
