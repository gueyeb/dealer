FactoryGirl.define do
  factory :vehicle do
    vin { Faker::Lorem.characters(17) }
    year { 1900 + rand(150) }
    make { Faker::Name.first_name }
    model { Faker::Name.last_name }
  end

end

# == Schema Information
#
# Table name: vehicles
#
#  id                 :integer          not null, primary key
#  vin                :string           not null
#  year               :integer          not null
#  make               :string           not null
#  model              :string           not null
#  trim               :string
#  mileage            :integer
#  exterior_color     :string
#  interior_color     :string
#  transmission       :string
#  body_style         :string
#  drivetrain         :string
#  engine             :string
#  options            :text
#  comments           :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  asking_price_cents :integer
#  active             :boolean          default("true")
#
