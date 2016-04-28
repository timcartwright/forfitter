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

require 'rails_helper'

RSpec.describe Identity, :type => :model do
  it "should always have a provider and uid" do
    i = Identity.create
    expect( i ).to_not be_valid

    i = Identity.create( :provider => "test" )
    expect( i ).to_not be_valid

    i = Identity.create( :provider => "test", :uid => "1" )
    expect( i ).to be_valid
  end

  it "should have a unique uid" do
    i = Identity.create( :provider => "test", :uid => "1" )
    expect( i ).to be_valid

    i = Identity.create( :provider => "test", :uid => "1" )
    expect( i ).to_not be_valid
  end
end
