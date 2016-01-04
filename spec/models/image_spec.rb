require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'validations' do
    [:direct_upload_url, :vehicle_id].each do |attr|
      it "is invalid when #{attr} is not provided" do
        image = build(:image, attr => nil)
        image.valid?
        expect(image.errors[attr]).to include("can't be blank")
      end
    end
  end

  describe 'instance methods' do
    describe 'direct_upload_url=' do
      it 'unescapes the direct_upload_url provided by S3' do
        escaped_url = 'https://dealer-test.s3.amazonaws.com%2Fuploads%2F1423161982068-6clk2y1fau6ry66r-b06ac5c310fd6c71c31b56bfca540497%2F2015_01_01_006.jpg'
        unescaped_url = 'https://dealer-test.s3.amazonaws.com/uploads/1423161982068-6clk2y1fau6ry66r-b06ac5c310fd6c71c31b56bfca540497/2015_01_01_006.jpg'
        image = build(:image, direct_upload_url: escaped_url)
        expect(image.direct_upload_url).to eq(unescaped_url)
      end
    end

    describe '#post_processing_required?' do
      it 'indicates post processing IS required' do
        image = build(:image, image_content_type: 'image/jpeg')
        expect(image.post_process_required?).to be_truthy
      end

      it 'indicates post processing is NOT required' do
        image = build(:image, image_content_type: 'image/doc')
        expect(image.post_process_required?).to be_falsey
      end
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
