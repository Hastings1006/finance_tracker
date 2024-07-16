class TransactionController < ApplicationController
  def index
    @transactions = Transaction.joins(:transaction_categories).where(transaction_categories: { transaction_record_id: @transactions.pluck(:id) })
  end
  
  def new
    @transaction = Transaction.find(params[:id])
    @transactions_category = TransactionCategory.new
  end

  def create
    @transaction = Transaction.find(params[:id])
    @transactions_category = TransactionCategory.where(id: params.dig(:transactions_category, :category))
    @transactions_category.each do |category|
      transaction_category = TransactionCategory.new(category_id: category.id, transaction_record: @transaction.id)
      transaction_category.save
    end
    redirect_to transaction_path(@transaction)
  end
end
