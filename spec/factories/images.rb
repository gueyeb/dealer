FactoryGirl.define do
  factory :image do
    vehicle
    direct_upload_url "https://dealer-test.s3.amazonaws.com%2Fuploads%2F1423161982068-6clk2y1fau6ry66r-b06ac5c310fd6c71c31b56bfca540497%2F2015_01_01_006.jpg"
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
