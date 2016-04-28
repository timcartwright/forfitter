class AddNumberOfWeeksToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :number_of_weeks, :integer
  end
end
