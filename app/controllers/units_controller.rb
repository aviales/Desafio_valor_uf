class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :update, :destroy]

  # GET /units
  def index
    @units = Unit.all

    render json: @units
  end

  # GET /units/1
  def show
    user = request.headers["X-CLIENTE"]
    Request.create(user:user)
    respond_to do |format|
      format.json {
        render json: @unit
      }
    end
  end

  # POST /units
  def create
    @unit = Unit.new(unit_params)

    if @unit.save
      render json: @unit, status: :created, location: @unit
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /units/1
  def update
    if @unit.update(unit_params)
      render json: @unit
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /units/1
  def destroy
    @unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find_by(date:params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def unit_params
      params.require(:unit).permit(:date, :value)
    end
end
