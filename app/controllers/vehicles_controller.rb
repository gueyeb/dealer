class VehiclesController < ApplicationController

  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
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
    flash[:notice] = 'Vehicle successfully created!'
    redirect_to(new_vehicle_image_path(@vehicle))
  end

  def update
    Vehicles::Update.new(@vehicle, vehicle_params).call
    render :show
  end

  def destroy
    Vehicles::Delete.new(@vehicle).call
    flash[:notice] = 'Vehicle has been removed from inventory.'
    redirect_to root_path
  end

  private

  def set_vehicle
    begin
      @vehicle = Vehicle.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      invalid_vehicle_redirect
    end
  end

  def ensure_active_vehicle
    invalid_vehicle_redirect unless @vehicle.active
  end

  def invalid_vehicle_redirect
    flash[:error] = 'That vehicle is not in inventory'
    redirect_to root_path
  end

  def vehicle_params
    params.
      require(:vehicle).
      permit(:vin, :year, :make, :model, :trim, :mileage, :exterior_color, :interior_color, :interior_material, :transmission, :body_style, :drivetrain, :engine, :options, :comments, :asking_price)
  end

end
