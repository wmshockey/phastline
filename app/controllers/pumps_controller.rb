class PumpsController < ApplicationController
  before_action :set_pump, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /pumps
  # GET /pumps.json
  def index
    if current_user.admin? then
      @pumps = Pump.all
    else
      @pumps = current_user.pumps.all
    end
  end

  # GET /pumps/1
  # GET /pumps/1.json
  def show
  end

  # GET /pumps/new
  def new
    @pumps = current_user.pumps.all
    @pump = current_user.pumps.build
  end

  # GET /pumps/1/edit
  def edit
  end

  # GET /pumps/1/copy
  def copy
    pumps = current_user.pumps
    @pump = pumps.find(params[:id])
    respond_to do |format|
      pump_copy = @pump.copy(pumps, @pump)
      if pump_copy
        format.html { redirect_to pumps_url, notice: "Pump #{@pump.pump_id} was successfully copied to: #{pump_copy.pump_id}." }
        format.json { head :no_content }
      else
        flash[:error] = "Pump copy failed."
        format.html { render :show, notice: 'Pump copy failed.' }
        format.json { render json: pump_copy.errors, status: :unprocessable_entity }
      end
    end        
  end

  # POST /pumps
  # POST /pumps.json
  def create
    @pump = current_user.pumps.build(pump_params)
    @pumps = current_user.pumps.all

    respond_to do |format|
      if @pump.save
        format.html { redirect_to @pump, notice: 'Pump was successfully created.' }
        format.json { render :show, status: :created, location: @pump }
      else
        format.html { render :new }
        format.json { render json: @pump.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pumps/1
  # PATCH/PUT /pumps/1.json
  def update
    respond_to do |format|
      if @pump.update(pump_params)
        format.html { redirect_to @pump, notice: 'Pump was successfully updated.' }
        format.json { render :show, status: :ok, location: @pump }
      else
        format.html { render :edit }
        format.json { render json: @pump.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pumps/1
  # DELETE /pumps/1.json
  def destroy
    @pump.destroy
    respond_to do |format|
      format.html { redirect_to pumps_url, notice: 'Pump was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pump
      @pumps = current_user.pumps.all 
      begin
        @pump = Pump.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @pump = nil
        flash[:error] = "Pump #{params[:id]} cannot be found or no longer exists."
        respond_to do |format|
          format.html { redirect_to pumps_url, notice: "Pump with id #{params[:id]} not found." }
          format.json { head :no_content }
        end
      end      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pump_params
      params.require(:pump).permit(:pump_id, :description, :flow_units, :head_units, :pressure_units, :minimum_suction, :stages, :impeller_diameter, :efficiency_correction_factor, :capacity_correction_factor, :head_correction_factor)
    end
end
