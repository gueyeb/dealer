class AddAskingPriceCentsToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :asking_price_cents, :integer
  end
end
