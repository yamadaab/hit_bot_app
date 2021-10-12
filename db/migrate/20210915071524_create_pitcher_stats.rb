class CreatePitcherStats < ActiveRecord::Migration[6.1]
  def change
    create_table :pitcher_stats do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.integer :games
      t.integer :win_pitchers
      t.integer :lost_pitchers
      t.integer :saves
      t.integer :holds
      t.integer :hold_points
      t.integer :complete_games
      t.integer :shut_outs
      t.integer :no_base_on_balls
      t.integer :hitters
      t.integer :innings_pitched
      t.integer :hits_Allowed
      t.integer :home_runs_allowed
      t.integer :base_on_balls
      t.integer :hits_by_pitch
      t.integer :strike_outs
      t.integer :wild_pitchs
      t.integer :balks
      t.integer :runs_allowed
      t.integer :earned_runs
      t.string :earned_runs_average
      t.string :whip

      t.timestamps
    end
  end
end
