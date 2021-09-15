class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :uniform_number
      t.string :name
      t.string :player_url

      t.timestamps
    end
  end
end
