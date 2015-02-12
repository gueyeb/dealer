class VehiclesController < ApplicationController

  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  before_action :ensure_active_vehicle, only: [:show, :edit, :update]
  before_action :ensure_admin, only: [:new, :create, :edit, :update, :destroy]

  respond_to :html

  def index
    @vehicles = Vehicle.active
    respond_with(@vehicles)
  end

  def show
    respond_with(@vehicle)
  end

  def new
    @vehicle = Vehicle.new
    respond_with(@vehicle)
  end

  def edit
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.asking_price_cents = vehicle_params[:asking_price_cents].to_i * 100
    @vehicle.active = true
    @vehicle.save
    respond_with(@vehicle)
  end

  def update
    @vehicle.update(vehicle_params)
    respond_with(@vehicle)
  end

  def destroy
    @vehicle.update! active: false
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
      permit(:vin, :year, :make, :model, :trim, :mileage, :exterior_color, :interior_color, :interior_material, :transmission, :body_style, :drivetrain, :engine, :options, :comments, :asking_price_cents)
  end

end
