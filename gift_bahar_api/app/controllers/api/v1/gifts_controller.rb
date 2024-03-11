class Api::V1::GiftsController < ApplicationController
  before_action :set_gift, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /api/v1/gifts
  def index
    @gifts = Gift.all

    render json: @gifts
  end

  # GET /api/v1/gifts/1
  def show
    render json: @gift
  end

  # POST /api/v1/gifts
  def create
    @gift = Gift.new(api_v1_gift_params)

    if @gift.save
      render json: @gift, status: :created, location: @gift
    else
      render json: @gift.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/gifts/1
  def update
    if @gift.update(api_v1_gift_params)
      render json: @gift
    else
      render json: @gift.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/gifts/1
  def destroy
    @gift.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_gift
      @gift = Gift.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_gift_params
      params.require(:gift).permit(:name, :description)
    end
end
