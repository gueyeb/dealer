class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy, :archive]
  before_action :ensure_active_vehicle, only: [:show, :edit, :update]
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]

  respond_to :html

  def index
    @vehicles = Vehicle.active
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicles::Create.new(vehicle_params).call

    if @vehicle.persisted?
      flash[:notice] = 'Vehicle successfully created!'
      redirect_to(new_vehicle_image_path(@vehicle))
    else
      render :new
    end
  end

  def update
    result = Vehicles::Update.new(@vehicle, vehicle_params).call

    result ? render(:show) : render(:edit)
  end

  def destroy
    Vehicles::Delete.new(@vehicle).call
    flash[:notice] = 'Vehicle has been completely removed.'
    redirect_to root_path
  end

  def archive
    Vehicles::Archive.new(@vehicle).call
    flash[:notice] = 'Vehicle has been archived and will no longer be shown to customers.'
    redirect_to root_path
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    invalid_vehicle_redirect
  end

  def ensure_active_vehicle
    invalid_vehicle_redirect unless @vehicle.active
  end

  def invalid_vehicle_redirect
    flash[:error] = 'That vehicle is not in inventory'
    redirect_to root_path
  end

  def vehicle_params
    params
      .require(:vehicle)
      .permit(:vin, :year, :make, :model, :trim, :mileage, :exterior_color, :interior_color, :interior_material, :transmission, :body_style, :drivetrain, :engine, :options, :comments, :asking_price)
  end
end
