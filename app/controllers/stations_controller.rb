class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    @pipeline = Pipeline.find(params[:pipeline_id])
    @stations = @pipeline.stations.all
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    @units = @station.units.all
  end

  # GET /stations/new
  def new
    @pipeline = Pipeline.find(params[:pipeline_id])
    @station = @pipeline.stations.build
  end

  # GET /stations/1/edit
  def edit
  end

  # POST /stations
  # POST /stations.json
  def create
    @pipeline = Pipeline.find(params[:pipeline_id])
    @station = @pipeline.stations.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to new_pipeline_station_path(@pipeline), notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to pipeline_path(@pipeline), notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
      respond_to do |format|
        if @station.destroy
          format.html { redirect_to pipeline_path(@pipeline), notice: 'Station was successfully deleted.' }
          format.json { render :show, status: :destroyed, location: @pipeline }
        else
          format.html { render :delete }
          format.json { render json: @station.errors, status: :unprocessable_entity }
        end
      end
    end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @pipeline = Pipeline.find(params[:pipeline_id])
      @station = @pipeline.stations.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:id, :name, :kmp)
    end
end
