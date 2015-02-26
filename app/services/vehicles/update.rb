module Vehicles
  class Update
    attr_reader :vehicle, :attrs

    def initialize(vehicle, attrs)
      @vehicle, @attrs = vehicle, attrs
    end

    def call
      vehicle.update attrs
    end

  end
end