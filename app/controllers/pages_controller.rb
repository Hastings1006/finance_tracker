class PagesController < ApplicationController
  def home
    @accounts = Account.where(user_id: current_user.id)
    @total = @accounts.sum(:balance)


    @budgets = Budget.where(user: current_user.id)

  end


end
