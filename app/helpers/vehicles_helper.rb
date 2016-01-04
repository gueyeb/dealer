module VehiclesHelper
  def vehicle_main_image(vehicle)
    image = vehicle.primary_image || vehicle.images.first
    image.image.url(:medium)
  end

  def vehicle_title(vehicle)
    "#{vehicle.year} #{vehicle.make} #{vehicle.model} #{vehicle.trim}"
  end

  def vehicle_images_in_display_order(vehicle)
    images = []

    if vehicle.images.present?
      images << vehicle.primary_image if vehicle.primary_image
      images += vehicle.non_primary_images.order(created_at: :asc).entries
    end

    images
  end
end
