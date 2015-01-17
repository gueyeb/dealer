json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :vin, :year, :make, :model, :trim, :mileage, :exterior_color, :interior_color, :transmission, :body_style, :drivetrain, :engine, :options, :comments
  json.url vehicle_url(vehicle, format: :json)
end
