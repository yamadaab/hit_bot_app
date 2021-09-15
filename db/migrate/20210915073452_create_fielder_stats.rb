class CreateFielderStats < ActiveRecord::Migration[6.1]
  def change
    create_table :fielder_stats do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.string :games
      t.string :plate_appearances
      t.string :at_bats
      t.string :runs
      t.string :hits
      t.string :two_base_hits
      t.string :three_base_hits
      t.string :home_runs
      t.string :base_hit
      t.string :RBI
      t.string :stolen_base
      t.string :caught_stealing
      t.string :sacrifice_flys
      t.string :base_on_balls
      t.string :hits_by_pitch
      t.string :strike_outs
      t.string :double_play
      t.string :batting_average
      t.string :on_base_percentage
      t.string :slugging_percentage
      t.string :on_base_plus_slugging

      t.timestamps
    end
  end
end
