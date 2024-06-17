class PagesController < ApplicationController
  def home
    @accounts = Account.where(user_id: current_user.id)
  end
end
