class AddTimesPerWeekToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :times_per_week, :integer
  end
end
