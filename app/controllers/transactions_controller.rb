class TransactionsController < ApplicationController
  before_action :set_transactions, only: [:index]
  # before_action :set_account, only: [:show, :create]

  def index
  end

  def show
    if params[:account_id]
      @transaction = @account.transactions
    else
      @transaction = Transaction.find(params[:id])
    end
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)


    @transaction.user = current_user

    if @transaction.save
      redirect_to root_path, notice: "Transaction was created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_transactions
    @transactions = Transaction.where(user_id: current_user.id)
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :transaction_date, :account_id)
  end

end
