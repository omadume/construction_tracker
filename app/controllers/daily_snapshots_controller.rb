class DailySnapshotsController < ApplicationController
  before_action :set_building
  before_action :set_daily_snapshot, only: %i[ show update destroy ]

  # GET /daily_snapshots or /daily_snapshots.json
  def index
    @daily_snapshots = DailySnapshot.all
  end

  # GET /daily_snapshots/1 or /daily_snapshots/1.json
  def show
  end

  # POST /daily_snapshots or /daily_snapshots.json
  def create
    @daily_snapshot = @building.daily_snapshots.build(daily_snapshot_params)
    if @daily_snapshot.save
      render json: @daily_snapshot, status: :created, location: @daily_snapshot
    else
      render json: @daily_snapshot.errors, status: :unprocessable_entity
    end
  # Explicitly catching parameter errors for more robust error handling
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  # PATCH/PUT /daily_snapshots/1 or /daily_snapshots/1.json
  def update
    if @daily_snapshot.update(daily_snapshot_params)
      render json: @daily_snapshot
    else
      render json: @daily_snapshot.errors, status: :unprocessable_entity
    end
  # Explicitly catching parameter errors for more robust error handling
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  # DELETE /daily_snapshots/1 or /daily_snapshots/1.json
  def destroy
    if @daily_snapshot.destroy
      head :no_content
    else
      render json: { error: "Failed to destroy daily_snapshot" }, status: :unprocessable_entity
    end
  end

  private
    def set_daily_snapshot
      @daily_snapshot = DailySnapshot.find(params[:id])
      render json: { error: "Daily snapshot not found" }, status: :not_found unless @bdaily_snapshot
    end

    def set_building
      @building = Building.find(params[:building_id])
      render json: { error: "Building not found" }, status: :not_found unless @building
    end

    def daily_snapshot_params
      params.require(:daily_snapshot).permit(:building_id, :date, :building_name, :total_expenditure, :room_data)
    end
end
