class Vehicle < ActiveRecord::Base
end

# == Schema Information
#
# Table name: vehicles
#
#  id                :integer          not null, primary key
#  vin               :string
#  year              :integer
#  make              :string
#  model             :string
#  trim              :string
#  mileage           :integer
#  exterior_color    :string
#  interior_color    :string
#  interior_material :string
#  transmission      :string
#  body_style        :string
#  drivetrain        :string
#  engine            :string
#  options           :text
#  comments          :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
