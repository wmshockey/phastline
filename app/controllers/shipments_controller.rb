class ShipmentsController < ApplicationController
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]

  # GET /shipments
  # GET /shipments.json
  def index
    @nomination = current_user.nominations.find(params[:nomination_id])
    @pipeline = @nomination.pipeline
    @shipments = @nomination.shipments.all
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
  end

  # GET /shipments/new
  def new
    @nomination = current_user.nominations.find(params[:nomination_id])
    @pipeline = current_user.pipelines.find {|p| p.id == @nomination.pipeline_id}
    @stations = @pipeline.stations
    @shipment = @nomination.shipments.build
  end

  # GET /shipments/1/edit
  def edit
    @nomination = current_user.nominations.find(params[:nomination_id])
    @pipeline = current_user.pipelines.find {|p| p.id == @nomination.pipeline_id}
    @stations = @pipeline.stations
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @nomination = current_user.nominations.find(params[:nomination_id])
    @pipeline = current_user.pipelines.find {|p| p.id == @nomination.pipeline_id}
    @stations = @pipeline.stations
    @shipments = @nomination.shipments.all
    @shipment = @nomination.shipments.new(shipment_params)    

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to nomination_shipments_path(@nomination), notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update
    respond_to do |format|
      if @shipment.update(shipment_params)
        format.html { redirect_to nomination_shipments_path(@nomination), notice: 'Shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment }
      else
        format.html { render :edit }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to nomination_shipments_path(@nomination), notice: 'Shipment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @nomination = Nomination.find(params[:nomination_id])
      @pipeline = Pipeline.find {|p| p.id == @nomination.pipeline_id}
      begin
         @shipment = @nomination.shipments.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @shipment = nil
        flash[:error] = "Shipment #{params[:id]} cannot be found or no longer exists."
        respond_to do |format|
          format.html { redirect_to nomination_shipments_path(@nomination), notice: "Shipment with id #{params[:id]} not found." }
          format.json { head :no_content }
        end
      end    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:id, :start_location, :end_location, :shipper, :commodity_id, :volume)
    end
end
