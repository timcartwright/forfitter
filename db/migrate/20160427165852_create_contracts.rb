class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :minutes_of_activity
      t.string :time_period
      t.date :start_date
      t.date :end_date
      t.integer :forfit_amount
      t.integer :number_of_forfits

      t.timestamps null: false
    end
  end
end
