class  Api::SurfboardsController < ApplicationController
  before_action :set_surfboard, only: [:show, :edit, :destroy]

  def index
    render json: Surfboard.all
  end

  def create
    surfboard = Surfboard.new(surfboard_params)
    if surfboard.save
      render json: surfboard
    else
      render json: {message: surfboard.errors}, status: 400
    end
  end

  def show
    render json: @surfboard
  end

  def update
    if @surfboard.update(surfboard_params)
      render json: @surfboard
    else
      render json: {message: surfboard.errors}, status: 400
    end
  end

  def destroy
    if @surfboard.destroy
      render json: {message: "Successfully deleted"}, status: 204
    else
      render json: {message: surfboard.errors}, status: 400
    end
  end

  private

  def set_surfboard
    @surfboard = Surfboard.find(params[:id])
  end

  def surfboard_params
    params.require(:surfboard).permit(:name, :price, :img_url, :length)
  end
end
