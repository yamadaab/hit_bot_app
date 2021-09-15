class NotifingStatsController < ApplicationController
  before_action :set_notifing_stat, only: %i[ show edit update destroy ]

  # GET /notifing_stats or /notifing_stats.json
  def index
    @notifing_stats = NotifingStat.all
  end

  # GET /notifing_stats/1 or /notifing_stats/1.json
  def show
  end

  # GET /notifing_stats/new
  def new
    @notifing_stat = NotifingStat.new
  end

  # GET /notifing_stats/1/edit
  def edit
  end

  # POST /notifing_stats or /notifing_stats.json
  def create
    @notifing_stat = NotifingStat.new(notifing_stat_params)

    respond_to do |format|
      if @notifing_stat.save
        format.html { redirect_to @notifing_stat, notice: "Notifing stat was successfully created." }
        format.json { render :show, status: :created, location: @notifing_stat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notifing_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifing_stats/1 or /notifing_stats/1.json
  def update
    respond_to do |format|
      if @notifing_stat.update(notifing_stat_params)
        format.html { redirect_to @notifing_stat, notice: "Notifing stat was successfully updated." }
        format.json { render :show, status: :ok, location: @notifing_stat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notifing_stat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifing_stats/1 or /notifing_stats/1.json
  def destroy
    @notifing_stat.destroy
    respond_to do |format|
      format.html { redirect_to notifing_stats_url, notice: "Notifing stat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notifing_stat
      @notifing_stat = NotifingStat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notifing_stat_params
      params.require(:notifing_stat).permit(:user_id, :player_id, :kind, :target, :previous_stat)
    end
end
