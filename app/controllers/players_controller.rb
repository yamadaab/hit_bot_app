class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])

    # @player_stat = player.pitcher_stat if player.pitcher?
    # @player_stat = player.fielder_stat if player.fielder?
  end
end
