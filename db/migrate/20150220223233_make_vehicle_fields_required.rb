class MakeVehicleFieldsRequired < ActiveRecord::Migration
  def change
    [:vin, :year, :make, :model].each do |attr|
      change_column_null :vehicles, attr, false
    end
  end
end
