class HeadpointsController < ApplicationController
  before_action :set_headpoint, only: [:show, :edit, :update, :destroy]

  # GET /headpoints
  # GET /headpoints.json
  def index
    @pumps = Pump.all
    @pump = Pump.find(params[:pump_id])
    @headpoints = @pump.headpoints.all
  end

  # GET /headpoints/1
  # GET /headpoints/1.json
  def show
  end

  # GET /headpoints/new
  def new
    @pumps = Pump.all
    @pump = Pump.find(params[:pump_id])
    @headpoint = @pump.headpoints.build
  end

  # GET /headpoints/1/edit
  def edit
  end

  # POST /headpoints
  # POST /headpoints.json
  def create
    @pumps = Pump.all
    @pump = Pump.find(params[:pump_id])
    @headpoints = @pump.headpoints.all
    @headpoint = @pump.headpoints.new(headpoint_params)
    respond_to do |format|
      if @headpoint.save
        format.html { redirect_to pump_path(@pump), notice: 'Headpoint was successfully created.' }
        format.json { render :show, status: :created, location: @headpoint }
      else
        format.html { render :new }
        format.json { render json: @headpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /headpoints/1
  # PATCH/PUT /headpoints/1.json
  def update
    respond_to do |format|
      if @headpoint.update(headpoint_params)
        format.html { redirect_to pump_path(@pump), notice: 'Headpoint was successfully updated.' }
        format.json { render :show, status: :ok, location: @headpoint }
      else
        format.html { render :edit }
        format.json { render json: @headpoint.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headpoints/1
  # DELETE /headpoints/1.json
  def destroy
    @headpoint.destroy
    respond_to do |format|
      format.html { redirect_to pump_path(@pump), notice: 'Headpoint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headpoint
      @pumps = Pump.all
      @pump = Pump.find(params[:pump_id])
      begin
        @headpoint = @pump.headpoints.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @headpoint = nil
        flash[:error] = "Headpoint #{params[:id]} cannot be found or no longer exists."
        respond_to do |format|
          format.html { redirect_to pump_path(@pump), notice: "Headpoint with id #{params[:id]} not found." }
          format.json { head :no_content }
        end
      end     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def headpoint_params
      params.require(:headpoint).permit(:id, :pump_id, :flow, :head)
    end
end
