class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  # GET /activities
  # GET /activities.json
  def index
    @schedule = Schedule.find(params[:schedule_id])
    @activities = @schedule.activities.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @schedule = Schedule.find(params[:schedule_id])
    @pipeline = Pipeline.find {|p| p.name == @schedule.pipeline_name}
    @stations = @pipeline.stations
    @activity = @schedule.activities.build
  end


  # GET /activities/1/edit
  def edit
    @schedule = Schedule.find(params[:schedule_id])
    @pipeline = Pipeline.find {|p| p.name == @schedule.pipeline_name}
    @stations = @pipeline.stations
  end

  # POST /activities
  # POST /activities.json
  def create
    @schedule = Schedule.find(params[:schedule_id])
    @activity = @schedule.activities.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to new_schedule_activity_path(@schedule), notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to schedule_path(@schedule), notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to schedule_path(@schedule), notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @schedule = Schedule.find(params[:schedule_id])
      @activity = Activity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:batch_id, :start_time, :end_time, :activity_type, :volume, :station, :shipper, :nomination_name)
    end
end
