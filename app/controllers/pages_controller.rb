class PagesController < ApplicationController
  def home
    @accounts = Account.where(user_id: current_user.id)
    @total = @accounts.sum(:balance)
  end
end
