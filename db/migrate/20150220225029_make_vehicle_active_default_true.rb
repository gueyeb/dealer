class MakeVehicleActiveDefaultTrue < ActiveRecord::Migration
  def up
    change_column_default :vehicles, :active, true
  end

  def down
    change_column_default :vehicles, :active, false
  end
end
