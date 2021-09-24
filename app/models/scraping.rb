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
end
