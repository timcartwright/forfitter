# == Schema Information
#
# Table name: identities
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  provider    :string
#  accesstoken :string
#  uid         :string
#  name        :string
#  email       :string
#  nickname    :string
#  image       :string
#  phone       :string
#  urls        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  secrettoken :string
#

FactoryGirl.define do
  factory :identity do
    user nil
    provider "MyString"
    accesstoken "MyString"
    uid "MyString"
    name "MyString"
    email "MyString"
    nickname "MyString"
    image "MyString"
    phone "MyString"
    urls "MyString"
  end
end
