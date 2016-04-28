class ContractsController < ApplicationController

  def index
    @contracts = current_user.contracts
  end

  def new
    @contract = Contract.new
  end

  def create
    contract = current_user.contracts.new(contract_params)

    if contract.save
      flash[:notice] = "Contract Created"
    else
      flash[:alert] = "Couldn't Create Contract"
    end

    redirect_to contracts_path
  end

private
  def contract_params
    params.require(:contract).permit(:minutes_of_activity, :time_period, :forfit_amount)
  end  

end
