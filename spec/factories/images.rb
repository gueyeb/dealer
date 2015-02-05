FactoryGirl.define do
  factory :image do
    
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
#
# Indexes
#
#  index_images_on_vehicle_id  (vehicle_id)
#
