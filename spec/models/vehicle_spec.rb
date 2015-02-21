require 'rails_helper'
require 'money-rails/test_helpers'
include MoneyRails::TestHelpers

RSpec.describe Vehicle, :type => :model do
  it 'should monetize the various prices' do
    vehicle = build(:vehicle, asking_price: 1000)
    expect(vehicle).to monetize(:asking_price_cents)
  end

  describe 'validations' do
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

    context 'year' do
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

    context 'vin' do
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

    context 'mileage' do
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

  describe 'scopes' do
    it '.active should return only active vehicles' do
      active_vehicle = create(:vehicle)
      inactive_vehicle = create(:vehicle, active: false)
      vehicles = Vehicle.active
      expect(vehicles).to include(active_vehicle)
      expect(vehicles).to_not include(inactive_vehicle)
    end
  end

  describe 'instance methods' do
    describe '#primary_image' do
      it 'should return the first primary image' do
        image = create(:image, primary: true)
        expect(image.vehicle.primary_image).to eq(image)
      end
    end

    describe '#has_primary_image?' do
      it 'should indicate vehicle has primary image' do
        image = create(:image, primary: true)
        expect(image.vehicle.has_primary_image?).to be_truthy
      end

      it 'should indicate vehicle does NOT have primary image' do
        image = create(:image)
        expect(image.vehicle.has_primary_image?).to be_falsey
      end
    end

    describe '#non_primary_images' do
      it 'should contain images that are not primary' do
        image = create(:image)
        expect(image.vehicle.non_primary_images).to include(image)
      end

      it 'should NOT contain primary images' do
        image = create(:image, primary: true)
        expect(image.vehicle.non_primary_images).to_not include(image)
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
