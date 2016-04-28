class PagesController < ApplicationController
  def home
    @contract = Contract.new
  end
end
