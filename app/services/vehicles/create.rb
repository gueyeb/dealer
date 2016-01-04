module Vehicles
  class Create
    attr_reader :vehicle_attrs

    def initialize(vehicle_attrs)
      @vehicle_attrs = vehicle_attrs
    end

    def call
      vehicle = Vehicle.new(vehicle_attrs)
      vehicle.active = true
      vehicle.save
      vehicle
    end
  end
end
