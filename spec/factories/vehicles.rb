FactoryGirl.define do
  factory :vehicle do
    vin "MyString"
year 1
make "MyString"
model "MyString"
trim "MyString"
mileage 1
exterior_color "MyString"
interior_color "MyString"
interior_material "MyString"
transmission "MyString"
body_style "MyString"
drivetrain "MyString"
engine "MyString"
options "MyText"
comments "MyText"
  end

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
