class AddActiveToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :active, :boolean, default: false
  end
end
