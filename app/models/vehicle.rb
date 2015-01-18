class Vehicle < ActiveRecord::Base

  validates_presence_of :vin, :year, :make, :model
  validates_numericality_of :year, greater_than_or_equal_to: 1900, less_than: 2050
  validates_length_of :vin, is: 17
  validates_numericality_of :mileage, greater_than_or_equal_to: 0, less_than: 1_000_000, allow_nil: true

end

# == Schema Information
#
# Table name: vehicles
#
#  id             :integer          not null, primary key
#  vin            :string
#  year           :integer
#  make           :string
#  model          :string
#  trim           :string
#  mileage        :integer
#  exterior_color :string
#  interior_color :string
#  transmission   :string
#  body_style     :string
#  drivetrain     :string
#  engine         :string
#  options        :text
#  comments       :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
