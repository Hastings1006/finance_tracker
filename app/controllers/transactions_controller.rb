class TransactionsController < ApplicationController
  before_action :set_transactions, only: [:index, :edit, :update, :destroy]
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

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
    if @transaction.update(transaction_params)
      redirect_to transaction_path(@transaction), notice: 'Transaction was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to transactions_path, notice: 'Transaction was successfully destroyed.'
  end

  private

  def set_transactions
    @transactions = Transaction.joins(account: :user).where(users: { id: current_user.id})
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :transaction_type, :transaction_date, :account_id)
  end

end
