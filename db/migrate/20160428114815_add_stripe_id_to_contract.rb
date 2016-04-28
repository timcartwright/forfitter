class AddStripeIdToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :stripe_customer_id, :string
  end
end
