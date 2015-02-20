require 'rails_helper'

RSpec.describe Vehicle, :type => :model do
  it "should default 'active' to true" do
    vehicle = build(:vehicle)
    expect(vehicle.active).to be_truthy
  end

  context 'when omitting required fields' do
    it 'is invalid when VIN is not provided' do
      vehicle = build(:vehicle, vin: nil)
      vehicle.valid?
      expect(vehicle.errors[:vin]).to include("can't be blank")
    end

    it 'is invalid when year is not provided' do
      vehicle = build(:vehicle, year: nil)
      vehicle.valid?
      expect(vehicle.errors[:year]).to include("can't be blank")
    end

    it 'is invalid when make is not provided' do
      vehicle = build(:vehicle, make: nil)
      vehicle.valid?
      expect(vehicle.errors[:make]).to include("can't be blank")
    end

    it 'is invalid when model is not provided' do
      vehicle = build(:vehicle, model: nil)
      vehicle.valid?
      expect(vehicle.errors[:model]).to include("can't be blank")
    end
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
