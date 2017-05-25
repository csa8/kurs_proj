class IgnorlistsController < ApplicationController
  before_action :set_ignorlist, only: [:show, :edit, :update, :destroy]

  # GET /ignorlists
  # GET /ignorlists.json
  def index
    @ignorlists = Ignorlist.all
  end

  # GET /ignorlists/1
  # GET /ignorlists/1.json
  def show
  end

  # GET /ignorlists/new
  def new
    @ignorlist = Ignorlist.new
  end

  # GET /ignorlists/1/edit
  def edit
  end

  # POST /ignorlists
  # POST /ignorlists.json
  def create
    @ignorlist = Ignorlist.new(ignorlist_params)

    respond_to do |format|
      if @ignorlist.save
        format.html { redirect_to @ignorlist, notice: 'Ignorlist was successfully created.' }
        format.json { render :show, status: :created, location: @ignorlist }
      else
        format.html { render :new }
        format.json { render json: @ignorlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ignorlists/1
  # PATCH/PUT /ignorlists/1.json
  def update
    respond_to do |format|
      if @ignorlist.update(ignorlist_params)
        format.html { redirect_to @ignorlist, notice: 'Ignorlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @ignorlist }
      else
        format.html { render :edit }
        format.json { render json: @ignorlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ignorlists/1
  # DELETE /ignorlists/1.json
  def destroy
    @ignorlist.destroy
    respond_to do |format|
      format.html { redirect_to ignorlists_url, notice: 'Ignorlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ignorlist
      @ignorlist = Ignorlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ignorlist_params
      params.require(:ignorlist).permit(:schedule_id, :station_id)
    end
end
