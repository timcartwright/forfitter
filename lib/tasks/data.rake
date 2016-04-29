namespace :data do
  desc "Download and process activity data"
  task get_strava_data: :environment do
    puts "Getting Strava data..."
    today = Date.today
    strava_contracts = Contract.all
    strava_contracts.each do |contract|
      contract.process_strava_data(today.last_week, today.last_week.end_of_week)
    end
  end
end