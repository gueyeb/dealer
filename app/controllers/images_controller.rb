class ImagesController < ApplicationController

  before_action :set_image, only: [:download]
  before_action :ensure_admin, only: [:new, :create, :download]

  def create
    @image = vehicle.images.create!(image_params)
  end

  def download
    redirect_to @image.image.expiring_url(30.seconds, :original)
  end

  private

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:direct_upload_url)
  end

  def vehicle
    Vehicle.find(params[:vehicle_id])
  end

end