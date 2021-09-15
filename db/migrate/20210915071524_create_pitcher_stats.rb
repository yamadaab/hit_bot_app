class CreatePitcherStats < ActiveRecord::Migration[6.1]
  def change
    create_table :pitcher_stats do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.string :games
      t.string :win_pitchers
      t.string :lost_pitchers
      t.string :saves
      t.string :holds
      t.string :hold_points
      t.string :complete_games
      t.string :shut_outs
      t.string :no_base_on_balls
      t.string :hitters
      t.string :innings_pitched
      t.string :hits_Allowed
      t.string :home_runs_allowed
      t.string :base_on_balls
      t.string :hits_by_pitch
      t.string :strike_outs
      t.string :wild_pitchs
      t.string :balks
      t.string :runs_allowed
      t.string :earned_runs
      t.string :earned_runs_average
      t.string :whip

      t.timestamps
    end
  end
end
