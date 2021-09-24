class Player < ApplicationRecord
  has_one :pitcher_stat
  has_one :fielder_stat

  def pitcher?
    position == "投手"
  end

  def fielder?
    position != "投手"
  end
end
