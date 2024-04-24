class DailySnapshotsController < ApplicationController
  before_action :set_daily_snapshot, only: %i[ show edit update destroy ]

  # GET /daily_snapshots or /daily_snapshots.json
  def index
    @daily_snapshots = DailySnapshot.all
  end

  # GET /daily_snapshots/1 or /daily_snapshots/1.json
  def show
  end

  # GET /daily_snapshots/new
  def new
    @daily_snapshot = DailySnapshot.new
  end

  # GET /daily_snapshots/1/edit
  def edit
  end

  # POST /daily_snapshots or /daily_snapshots.json
  def create
    @daily_snapshot = DailySnapshot.new(daily_snapshot_params)

    respond_to do |format|
      if @daily_snapshot.save
        format.html { redirect_to daily_snapshot_url(@daily_snapshot), notice: "Daily snapshot was successfully created." }
        format.json { render :show, status: :created, location: @daily_snapshot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @daily_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_snapshots/1 or /daily_snapshots/1.json
  def update
    respond_to do |format|
      if @daily_snapshot.update(daily_snapshot_params)
        format.html { redirect_to daily_snapshot_url(@daily_snapshot), notice: "Daily snapshot was successfully updated." }
        format.json { render :show, status: :ok, location: @daily_snapshot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @daily_snapshot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_snapshots/1 or /daily_snapshots/1.json
  def destroy
    @daily_snapshot.destroy!

    respond_to do |format|
      format.html { redirect_to daily_snapshots_url, notice: "Daily snapshot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_snapshot
      @daily_snapshot = DailySnapshot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_snapshot_params
      params.require(:daily_snapshot).permit(:building_id, :date, :total_expenditure)
    end
end
