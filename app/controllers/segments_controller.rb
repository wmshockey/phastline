class SegmentsController < ApplicationController
  before_action :set_segment, only: [:show, :edit, :update, :destroy]

  def index
    @pipeline = Pipeline.find(params[:pipeline_id])
    @segments = @pipeline.segments.all
  end
  
  def show    
    @pipeline = Pipeline.find(params[:pipeline_id])
    @segment = @pipeline.segments.find(params[:id])
  end

  def new
    @pipeline = Pipeline.find(params[:pipeline_id])
    @segment = @pipeline.segments.build
  end
  
  def edit
    @pipeline = Pipeline.find(params[:pipeline_id])
    @segment = @pipeline.segments.find(params[:id])
  end

  def create
    @pipeline = Pipeline.find(params[:pipeline_id])
    @segment = @pipeline.segments.new(segment_params)
    respond_to do |format|
      if @segment.save
        format.html { redirect_to new_pipeline_segment_path(@pipeline), notice: 'Segment was successfully created.' }
        format.json { render :show, status: :created, location: @segment }
      else
        format.html { render :new }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @pipeline = Pipeline.find(params[:pipeline_id])
    @segment = @pipeline.segments.find(params[:id])
    respond_to do |format|
      if @segment.update(segment_params)
        format.html {redirect_to @pipeline, notice: 'Segment was successfully updated.'}
        format.json {render :show, status: :updated, location: @segment}
      else
        format.html {render :edit}
        format.json {render json: @segment.errors, status: :unprocessable_entity}
      end
    end
  end
  
  def destroy
      @pipeline = Pipeline.find(params[:pipeline_id])
      @segment = @pipeline.segments.find(params[:id])
      respond_to do |format|
        if @segment.destroy
          format.html { redirect_to pipeline_path(@pipeline), notice: 'Segment was successfully deleted.' }
          format.json { render :show, status: :destroyed, location: @pipeline }
        else
          format.html { render :delete }
          format.json { render json: @segment.errors, status: :unprocessable_entity }
        end
      end
    end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_segment
    @pipeline = Pipeline.find(params[:pipeline_id])
    begin
      @segment = @pipeline.segments.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @segment = nil
      flash[:error] = "Segment #{params[:id]} cannot be found or no longer exists."
      respond_to do |format|
        format.html { redirect_to pipeline_path(@pipeline), notice: "Segment with id #{params[:id]} not found." }
        format.json { head :no_content }
      end
    end                
  end
  
    def segment_params
      params.require(:segment).permit(:id, :kmp, :diameter, :thickness, :roughness, :mawp)
    end
end
