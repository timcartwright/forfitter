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

class Contract < ActiveRecord::Base
  belongs_to :user

  def process_strava_data(date_from, date_to)
    qualifying_activities = 0
    strava_activities.each do |activity|
      qualifying_activities += 1 if qualifying_activity?(activity, date_from, date_to)
    end
    puts "Qualifying Activities: #{qualifying_activities}"
    check_contract(qualifying_activities)
  end

private
  def strava_activities
    client = Strava::Api::V3::Client.new(:access_token => self.strava_token)
    client.list_athlete_activities({after:1460871068})
  end

  def qualifying_activity?(activity, date_from, date_to)
    activity_date = DateTime.parse(activity["start_date_local"])
    return true if 
      date_from <= activity_date &&
      date_to >= activity_date &&
      activity["moving_time"] >= (self.minutes_of_activity * 60)
  end

  def check_contract(qualifying_activities)
    if qualifying_activities >= self.times_per_week
      puts "Contract OK"
    else
      puts "Contract Broken"
      take_payment(self.forfit_amount, self.stripe_customer_id)
    end
  end

  def take_payment(amount_in_pounds, customer_id)
    amount_in_pence = amount_in_pounds * 100
    Stripe::Charge.create(
        amount: amount_in_pence,
        currency: 'gbp',
        customer: customer_id
    )
  end
    
end
