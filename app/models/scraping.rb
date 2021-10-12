class Scraping
  require "net/http"
  require "uri"
  require 'nokogiri'

  def save_players
    team_short_names = ["g"]#Team.pluck(:short_name)
    team_short_names.map do |team_short_name|
      uri = URI.parse("https://baseball-data.com/player/" + team_short_name + "/")
      uri2 = Net::HTTP.get(uri)

      doc = Nokogiri::HTML(uri2)

      doc.xpath('//table[@id="tbl"]/tbody/*').each do |tr|
        Player.create!(
          position: tr.children[5].content, 
          uniform_number: tr.children[1].content,
          name: tr.children[3].content,
          player_url: tr.children[3].children.first.attributes["href"].value
        )
      end
    end
  end

  def save_all_player_stats
    Player.all.find_each(batch_size: 100) do |player|
      save_player_stat(player)
    end
  end

  def save_player_stat(player)
    save_pitcher_stat(player) if player.pitcher?
    save_fielder_stat(player) if player.fielder?
  end

private

  def save_pitcher_stat(player)
    if player.pitcher_stat
      player.pitcher_stat.update!(
        pitcher_total_result(scaping_total_result(player))
      )
    else 
      player.create_pitcher_stat!(
        pitcher_total_result(scaping_total_result(player))
      )
    end
  end

  def save_fielder_stat(player)
    if player.fielder_stat
      player.fielder_stat.update!(
        fielder_total_result(scaping_total_result(player))
      )
    else 
      player.create_fielder_stat!(
        fielder_total_result(scaping_total_result(player))
      )
    end
  end

  def scaping_total_result(player)
    uri = URI.parse(player.player_url)
    html = Net::HTTP.get(uri)
    doc = Nokogiri::HTML(html)

    total_result = []
    doc.xpath('//h3').each do |h3|
      next if h3.content != "年度別成績"
      total_result = h3.next_element.last_element_child.last_element_child.children.map do |each_result|
        each_result.content
      end
      total_result.shift
    end
    total_result
  end

  def pitcher_total_result(total_result)
    {
      games: total_result[0],
      win_pitchers: total_result[1],
      lost_pitchers: total_result[2],
      saves: total_result[3],
      holds: total_result[4],
      hold_points: total_result[5],
      complete_games: total_result[6],
      shut_outs: total_result[7],
      no_base_on_balls: total_result[8],
      hitters: total_result[9],
      innings_pitched: total_result[10],
      hits_Allowed: total_result[11],
      home_runs_allowed: total_result[12],
      base_on_balls: total_result[13],
      hits_by_pitch: total_result[14],
      strike_outs: total_result[15],
      wild_pitchs: total_result[16],
      balks: total_result[17],
      runs_allowed: total_result[18],
      earned_runs: total_result[19],
      earned_runs_average: total_result[20],
      whip: total_result[21]
    }
  end

  def fielder_total_result(total_result)
    {
      games: total_result[0],
      plate_appearances: total_result[1],
      at_bats: total_result[2],
      runs: total_result[3],
      hits: total_result[4],
      two_base_hits: total_result[5],
      three_base_hits: total_result[6],
      home_runs: total_result[7],
      base_hit: total_result[8],
      RBI: total_result[9],
      stolen_base: total_result[10],
      caught_stealing: total_result[11],
      sacrifice_bunts: total_result[12],
      sacrifice_flys: total_result[13],
      base_on_balls: total_result[14],
      hits_by_pitch: total_result[15],
      strike_outs: total_result[16],
      double_play: total_result[17],
      batting_average: total_result[18],
      on_base_percentage: total_result[19],
      slugging_percentage: total_result[20],
      on_base_plus_slugging: total_result[21],
    }
  end
end
