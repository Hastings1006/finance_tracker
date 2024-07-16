class TransactionCategoriesController < ApplicationController
  def index
    @transaction_categories = TransactionCategory.all
  end
end
