class LayoversController < ApplicationController
  before_action :set_layover, only: [:show, :edit, :update, :destroy]

  # GET /layovers
  # GET /layovers.json
  def index
    @layovers = Layover.all
  end

  # GET /layovers/1
  # GET /layovers/1.json
  def show
  end

  # GET /layovers/new
  def new
    @layover = Layover.new
  end

  # GET /layovers/1/edit
  def edit
  end

  # POST /layovers
  # POST /layovers.json
  def create
    @layover = Layover.new(layover_params)

    respond_to do |format|
      if @layover.save
        format.html { redirect_to @layover, notice: 'Layover was successfully created.' }
        format.json { render :show, status: :created, location: @layover }
      else
        format.html { render :new }
        format.json { render json: @layover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /layovers/1
  # PATCH/PUT /layovers/1.json
  def update
    respond_to do |format|
      if @layover.update(layover_params)
        format.html { redirect_to @layover, notice: 'Layover was successfully updated.' }
        format.json { render :show, status: :ok, location: @layover }
      else
        format.html { render :edit }
        format.json { render json: @layover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /layovers/1
  # DELETE /layovers/1.json
  def destroy
    @layover.destroy
    respond_to do |format|
      format.html { redirect_to layovers_url, notice: 'Layover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_layover
      @layover = Layover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def layover_params
      params.require(:layover).permit(:arrive_time, :schedule_id, :station_id)
    end
end
