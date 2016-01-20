module Vehicles
  class Archive
    attr_reader :vehicle

    def initialize(vehicle)
      @vehicle = vehicle
    end

    def call
      vehicle.update! active: false
    end
  end
end
