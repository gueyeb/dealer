class AddRequiredVehicleToImage < ActiveRecord::Migration
  def change
    change_column_null :images, :vehicle_id, false
  end
end
