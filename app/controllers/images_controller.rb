class ImagesController < ApplicationController
  before_action :set_image, only: [:destroy, :download]
  before_action :set_vehicle, except: [:download]
  before_action :ensure_admin, only: [:new, :create, :download]

  def new
    redirect_to(edit_vehicle_path(@vehicle)) if @vehicle.images.present?
  end

  def create
    @image = Images::Create.new(@vehicle, image_params.merge(primary: params[:primary])).call
  end

  def destroy
    Images::Delete.new(@image).call
    redirect_to(edit_vehicle_path(@vehicle))
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

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end
end
