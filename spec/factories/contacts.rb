FactoryGirl.define do
  factory :contact do
    name 'MyString'
    email 'MyString'
    subject 'MyString'
    message 'MyText'
  end
end

# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  subject    :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
