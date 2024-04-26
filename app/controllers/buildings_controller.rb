class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show update destroy ]

  # GET /buildings or /buildings.json
  def index
    @buildings = Building.all
  end

  # GET /buildings/1 or /buildings/1.json
  def show
  end

  # POST /buildings or /buildings.json
  def create
    @building = Building.new(building_params)
    if @building.save
      render json: @building, status: :created, location: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  # Explicitly catching parameter errors for more robust error handling
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  # PATCH/PUT /buildings/1 or /buildings/1.json
  def update
    if @building.update(building_params)
      render json: @building
    else
      render json: @building.errors, status: :unprocessable_entity
    end
  # Explicitly catching parameter errors for more robust error handling
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  # DELETE /buildings/1 or /buildings/1.json
  def destroy
    if @building.destroy
      head :no_content
    else
      render json: { error: "Failed to destroy building" }, status: :unprocessable_entity
    end
  end

  private
    def set_building
      @building = Building.find(params[:id])
      render json: { error: "Building not found" }, status: :not_found unless @building
    end

    def building_params
      params.require(:building).permit(:name, :budget, :total_expenditure)
    end
end
