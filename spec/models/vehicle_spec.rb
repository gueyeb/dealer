require 'rails_helper'

RSpec.describe Vehicle, :type => :model do
  context 'when validating' do
    it "should default 'active' to true" do
      vehicle = build(:vehicle)
      expect(vehicle.active).to be_truthy
    end

    [:vin, :year, :make, :model].each do |attr|
      it "is invalid when #{attr} is not provided" do
        vehicle = build(:vehicle, attr => nil)
        vehicle.valid?
        expect(vehicle.errors[attr]).to include("can't be blank")
      end
    end

    context 'the allowed values of year' do
      it 'is invalid for years before 1900' do
        vehicle = build(:vehicle, year: 1899)
        vehicle.valid?
        expect(vehicle.errors[:year]).to include('must be greater than or equal to 1900')
      end

      it 'is invalid for years after 2049' do
        vehicle = build(:vehicle, year: 2050)
        vehicle.valid?
        expect(vehicle.errors[:year]).to include('must be less than 2050')
      end
    end

    context 'the allowed length of vin' do
      it 'is invalid for less than 17 characters' do
        vehicle = build(:vehicle, vin: '1234567890123456')
        vehicle.valid?
        expect(vehicle.errors[:vin]).to include('is the wrong length (should be 17 characters)')
      end

      it 'is invalid for more than 17 characters' do
        vehicle = build(:vehicle, vin: '123456789012345678')
        vehicle.valid?
        expect(vehicle.errors[:vin]).to include('is the wrong length (should be 17 characters)')
      end
    end

    context 'the allowed mileage values' do
      it 'is invalid for negative mileage values' do
        vehicle = build(:vehicle, mileage: -1)
        vehicle.valid?
        expect(vehicle.errors[:mileage]).to include('must be greater than or equal to 0')
      end

      it 'is invalid for mileage values greater than 999_999' do
        vehicle = build(:vehicle, mileage: 1_000_000)
        vehicle.valid?
        expect(vehicle.errors[:mileage]).to include('must be less than 1000000')
      end
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
