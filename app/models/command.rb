class Command
  def self
    # scraping
    notifing_stat_is_updated?
  end

  def scraping
    Scraping.new.save_players
    Scraping.new.save_all_player_stats
  end

  def notifing_stat_is_updated?
    NotifingStat.all.each do |notifing_stat|
      player = Player.find(notifing_stat.player_id)
      if player.pitcher?
        latest_stat = player.pitcher_stat.send(notifing_stat.kind)
      elsif player.fielder?
        latest_stat = player.fielder_stat.send(notifing_stat.kind)
      end
      yesterday_result = latest_stat - notifing_stat.previous_stat
      if yesterday_result > 0
        NotifingStatMailer.with(
          notifing_stat: notifing_stat,
          yesterday_result: yesterday_result,
          player: player,
          target: notifing_stat.target,
          kind: notifing_stat.kind
          )
        notifing_stat.update(previous_stat: latest_stat)
      end
    end
  end

  def restat
    NotifingStat.find(1).update(previous_stat: 1892)
  end
end
# NotifingStatMailer.with(notifing_stat: NotifingStat.find(1), yesterday_result: 1, player: Player.find(9), target: 2000, kind: games)