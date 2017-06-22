class ElevationsController < ApplicationController
    before_action :set_elevation, only: [:show, :edit, :update, :destroy]

    # GET /elevations
    # GET /elevations.json
    def index
      @pipeline = Pipeline.find(params[:pipeline_id])
      @elevations = @pipeline.elevations.all
    end

    # GET /elevations/1
    # GET /elevations/1.json
    def show
    end

    # GET /elevations/new
    def new
      @pipeline = Pipeline.find(params[:pipeline_id])
      @elevation = @pipeline.elevations.build
    end

    # GET /elevations/1/edit
    def edit
    end

    # POST /elevations
    # POST /elevations.json
    def create
      @pipeline = Pipeline.find(params[:pipeline_id])
      @elevation = @pipeline.elevations.new(elevation_params)

      respond_to do |format|
        if @elevation.save
          format.html { redirect_to new_pipeline_elevation_path(@pipeline), notice: 'Elevation was successfully created.' }
          format.json { render :show, status: :created, location: @elevation }
        else
          format.html { render :new }
          format.json { render json: @elevation.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /elevations/1
    # PATCH/PUT /elevations/1.json
    def update
      respond_to do |format|
        if @elevation.update(elevation_params)
          format.html { redirect_to pipeline_path(@pipeline), notice: 'Elevation was successfully updated.' }
          format.json { render :show, status: :ok, location: @elevation }
        else
          format.html { render :edit }
          format.json { render json: @elevation.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /elevations/1
    # DELETE /elevations/1.json
    def destroy
        respond_to do |format|
          if @elevation.destroy
            format.html { redirect_to pipeline_path(@pipeline), notice: 'Elevation was successfully deleted.' }
            format.json { render :show, status: :destroyed, location: @pipeline }
          else
            format.html { render :delete }
            format.json { render json: @elevation.errors, status: :unprocessable_entity }
          end
        end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_elevation
        @pipeline = Pipeline.find(params[:pipeline_id])
        begin
          @elevation = @pipeline.elevations.find(params[:id])
        rescue ActiveRecord::RecordNotFound => e
          @elevation = nil
          flash[:error] = "Elevation #{params[:id]} cannot be found or no longer exists."
          respond_to do |format|
            format.html { redirect_to pipeline_path(@pipeline), notice: "Elevation with id #{params[:id]} not found." }
            format.json { head :no_content }
          end
        end                
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def elevation_params
        params.require(:elevation).permit(:id, :kmp, :elevation)
      end

end
