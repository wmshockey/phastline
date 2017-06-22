class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  # GET /units
  # GET /units.json
  def index
    @pipeline = Pipeline.find(params[:pipeline_id])
    @station = Station.find(params[:station_id])
    @units = @station.units.all
  end
  

  # GET /units/1
  # GET /units/1.json
  def show
    @pipeline = Pipeline.find(params[:pipeline_id])
    @station = Station.find(params[:station_id])
    @units = @station.units.all
  end

  # GET /units/new
  def new
    @pipeline = Pipeline.find(params[:pipeline_id])
    @station = Station.find(params[:station_id])
    @units = @station.units.all
    @unit = @station.units.build
  end

  # GET /units/1/edit
  def edit
    @pipeline = Pipeline.find(params[:pipeline_id])
    @station = Station.find(params[:station_id])
    @units = @station.units.all
  end

  # POST /units
  # POST /units.json
  def create
    @pipeline = Pipeline.find(params[:pipeline_id])
    @station = Station.find(params[:station_id])
    @units = @station.units.all
    @unit = @station.units.new(unit_params)
    respond_to do |format|
      if @unit.save
        format.html { redirect_to new_pipeline_station_unit_path(@pipeline, @station), notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units/1
  # PATCH/PUT /units/1.json
  def update
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to pipeline_station_path(@pipeline, @station), notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units/1
  # DELETE /units/1.json
  def destroy
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to pipeline_station_path(@pipeline, @station), notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @pipeline = Pipeline.find(params[:pipeline_id])
      @station = Station.find(params[:station_id])
      begin
        @unit = Unit.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @unit = nil
        flash[:error] = "Unit #{params[:id]} cannot be found or no longer exists."
        respond_to do |format|
          format.html { redirect_to pipeline_station_path(@pipeline, @station), notice: "Unit with id #{params[:id]} not found." }
          format.json { head :no_content }
        end
      end     
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:id, :station_id, :pump_id, :unit_row, :unit_column)
    end
end
