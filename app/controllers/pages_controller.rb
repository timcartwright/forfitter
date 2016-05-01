class PagesController < ApplicationController
  def home
    @contract = current_user.contracts.first || Contract.new
  end
end