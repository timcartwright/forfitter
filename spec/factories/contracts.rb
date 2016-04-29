# == Schema Information
#
# Table name: contracts
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  minutes_of_activity :integer
#  time_period         :string
#  start_date          :date
#  end_date            :date
#  forfit_amount       :integer
#  number_of_forfits   :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  times_per_week      :integer
#  number_of_weeks     :integer
#  stripe_customer_id  :string
#  strava_token        :string
#

FactoryGirl.define do
  factory :contract do
    user nil
    minutes_of_activity 1
    time_period "MyString"
    start_date "2016-04-27"
    end_date "2016-04-27"
    forfit_amount 1
    forfits 1
  end
end
