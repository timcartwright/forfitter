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
