module VehiclesHelper

  def vehicle_main_image(vehicle)
    vehicle.images.first.image.url(:medium)
  end

  def vehicle_title(vehicle)
    "#{vehicle.year} #{vehicle.make} #{vehicle.model} #{vehicle.trim}"
  end

end
