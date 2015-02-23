require 'rails_helper'

RSpec.describe Image, :type => :model do

  describe 'validations' do
    [:direct_upload_url, :vehicle_id].each do |attr|
      it "is invalid when #{attr} is not provided" do
        image = build(:image, attr => nil)
        image.valid?
        expect(image.errors[attr]).to include("can't be blank")
      end
    end

    it "doesn't allow invalid upload URLs" do
      image = build(:image, direct_upload_url: "http://www.mymaliciousurl.com")
      image.valid?
      expect(image.errors[:direct_upload_url]).to include("is invalid")
    end
  end

end

# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  vehicle_id         :integer          not null
#  direct_upload_url  :string           not null
#  processed          :boolean          default("false"), not null
#  primary            :boolean          default("false")
#
# Indexes
#
#  index_images_on_vehicle_id  (vehicle_id)
#
