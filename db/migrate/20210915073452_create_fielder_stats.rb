class CreateFielderStats < ActiveRecord::Migration[6.1]
  def change
    create_table :fielder_stats do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.integer :games
      t.integer :plate_appearances
      t.integer :at_bats
      t.integer :runs
      t.integer :hits
      t.integer :two_base_hits
      t.integer :three_base_hits
      t.integer :home_runs
      t.integer :base_hit
      t.integer :RBI
      t.integer :stolen_base
      t.integer :caught_stealing
      t.integer :sacrifice_bunts
      t.integer :sacrifice_flys
      t.integer :base_on_balls
      t.integer :hits_by_pitch
      t.integer :strike_outs
      t.integer :double_play
      t.string :batting_average
      t.string :on_base_percentage
      t.string :slugging_percentage
      t.string :on_base_plus_slugging

      t.timestamps
    end
  end
end
