class ElementsController < ApplicationController
  before_action :set_element, only: %i[ show update destroy ]
  before_action :set_room, only: %i[ update ]

  # GET /elements or /elements.json
  def index
    @elements = Element.all
    render json: @elements
  end

  # GET /elements/1 or /elements/1.json
  def show
    render json: @element
  end

  # POST /elements or /elements.json
  def create
    @element = Element.new(element_params)
    if @element.save
      render json: @element, status: :created, location: @element
    else
      render json: @element.errors, status: :unprocessable_entity
    end
  # Explicitly catching parameter errors for more robust error handling
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  # PATCH/PUT /elements/1 or /elements/1.json
  def update
    if @element.update(element_params)
      render json: @element
    else
      render json: @element.errors, status: :unprocessable_entity
    end
  # Explicitly catching parameter errors for more robust error handling
  rescue ActionController::ParameterMissing => e
    render json: { error: e.message }, status: :bad_request
  end

  # DELETE /elements/1 or /elements/1.json
  def destroy
    if @element.destroy
      head :no_content
    else
      render json: { error: "Failed to destroy element" }, status: :unprocessable_entity
    end
  end

  private
    def set_element
      @element = Element.find(params[:id])
      render json: { error: "Element not found" }, status: :not_found unless @element
    end

    def set_room
      return unless element_params[:room_id]

      @room = Room.find(params[:room_id])
      render json: { error: "Room not found" }, status: :not_found unless @room
    end

    def element_params
      params.require(:element).permit(:room_id, :name, :cost)
    end
end
