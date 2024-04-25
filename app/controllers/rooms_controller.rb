class RoomsController < ApplicationController
  before_action :set_building
  before_action :set_room, only: %i[ show update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # POST /rooms or /rooms.json
  def create
    @room = @building.rooms.build(room_params)
    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  # Explicitly catching parameter errors for more robust error handling
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  # Explicitly catching parameter errors for more robust error handling
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    if @room.destroy
      head :no_content
    else
      render json: { error: "Failed to destroy room" }, status: :unprocessable_entity
    end
  end

  private
    def set_room
      @room = @building.rooms.find(params[:id])
      render json: { error: "Room not found" }, status: :not_found unless @room
    end

    def set_building
      @building = Building.find(params[:building_id])
      render json: { error: "Building not found" }, status: :not_found unless @building
    end

    def room_params
      params.require(:room).permit(:building_id, :name, :cost)
    end
end
