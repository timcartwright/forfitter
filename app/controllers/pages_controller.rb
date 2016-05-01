class PagesController < ApplicationController
  def home
    if user_signed_in?
      @contract = current_user.contracts.first || Contract.new
    end 
  end
end