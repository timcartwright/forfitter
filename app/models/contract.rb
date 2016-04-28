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
#

class Contract < ActiveRecord::Base
  belongs_to :user
end
