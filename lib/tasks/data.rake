namespace :data do
  desc "Download and process activity data"
  task get_strava_data: :environment do
    puts "Getting Strava data..."
    strava_users = Identity.strava
    today = Date.today
    strava_users.each do |user|
      client = Strava::Api::V3::Client.new(:access_token => user.accesstoken)
      activities = client.list_athlete_activities({after:1461303068})
      times_per_week = 0
      activities.each do |activity|
        # puts activity["moving_time"] / 60
        # puts DateTime.parse(activity["start_date_local"])
        times_per_week += 1 if DateTime.parse(activity["start_date_local"]) > today.last_week && activity["moving_time"] >= 3600
      end
      puts times_per_week
    end
  end
end