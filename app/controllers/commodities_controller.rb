class CommoditiesController < ApplicationController
  before_action :set_commodity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /commodities
  # GET /commodities.json
  def index
    if current_user.admin? then
      @commodities = Commodity.all
    else
      @commodities = current_user.commodities.all
    end
  end

  # GET /commodities/1
  # GET /commodities/1.json
  def show
  end

  # GET /commodities/new
  def new
    @commodities = current_user.commodities.all
    @commodity = current_user.commodities.build
  end

  # GET /commodities/1/edit
  def edit
  end

  # GET /commodities/1/copy
  def copy
    commodities = current_user.commodities
    @commodity = commodities.find(params[:id])
    respond_to do |format|
      commodity_copy = @commodity.copy(commodities, @commodity)
      if commodity_copy
        format.html { redirect_to commodities_url, notice: "Commodity #{@commodity.commodity_id} was successfully copied to: #{commodity_copy.commodity_id}." }
        format.json { head :no_content }
      else
        flash[:error] = "Commodity copy failed."
        format.html { render :show, notice: 'Commodity copy failed.' }
        format.json { render json: commodities_copy.errors, status: :unprocessable_entity }
      end
    end        
  end

  # POST /commodities
  # POST /commodities.json
  def create
    @commodity = current_user.commodities.build(commodity_params)
    @commodities = current_user.commodities.all

    respond_to do |format|
      if @commodity.save
        format.html { redirect_to commodities_path, notice: 'Commodity was successfully created.' }
        format.json { render :show, status: :created, location: @commodity }
      else
        format.html { render :new }
        format.json { render json: @commodity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commodities/1
  # PATCH/PUT /commodities/1.json
  def update
    respond_to do |format|
      if @commodity.update(commodity_params)
        format.html { redirect_to commodities_path, notice: 'Commodity was successfully updated.' }
        format.json { render :show, status: :ok, location: @commodity }
      else
        format.html { render :edit }
        format.json { render json: @commodity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commodities/1
  # DELETE /commodities/1.json
  def destroy
    @commodity.destroy
    respond_to do |format|
      format.html { redirect_to commodities_url, notice: 'Commodity was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commodity
      @commodities = current_user.commodities.all
      begin
        @commodity = Commodity.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @commodity = nil
        flash[:error] = "Commodity #{params[:id]} cannot be found or no longer exists."
        respond_to do |format|
          format.html { redirect_to commodities_url, notice: "Commodity with id #{params[:id]} not found." }
          format.json { head :no_content }
        end
      end
      
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commodity_params
      params.require(:commodity).permit(:commodity_id, :commodity_name, :temp1, :visc1, :temp2, :visc2, :density, :density_cf, :vapor)
    end
end
