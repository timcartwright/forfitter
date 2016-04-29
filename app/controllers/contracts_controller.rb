class ContractsController < ApplicationController

  def index
    @contracts = current_user.contracts
  end

  def new
    @contract = Contract.new
  end

  def create
    customer = Stripe::Customer.create(
      card: params[:stripeToken],
      description: 'description for payinguser@example.com',
      email: params[:stripeEmail]
    )

    contract = current_user.contracts.new(contract_params)

    if contract.save
      save_stripe_customer_id(contract, customer.id)
      save_strava_token(contract)
      flash[:notice] = "Contract Created"
    else
      flash[:alert] = "Couldn't Create Contract"
    end

    redirect_to contracts_path
  end

private
  def contract_params
    params.require(:contract).permit(:minutes_of_activity, :times_per_week, :number_of_weeks, :forfit_amount)
  end

  def save_stripe_customer_id(contract, id)
    contract.stripe_customer_id = id
    contract.save
  end

  def get_stripe_customer_id(contract)
    contract.stripe_customer_id
  end

  def save_strava_token(contract)
    contract.strava_token = contract.user.identities.strava.first.accesstoken
    contract.save
  end

end
