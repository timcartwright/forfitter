class AddStravaTokenToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :strava_token, :string
  end
end
