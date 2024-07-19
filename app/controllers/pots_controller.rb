class PotsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_pots, only: [:index]
  before_action :set_user_pot, only: [:show, :edit, :update, :destroy]
  before_action :set_new_pot, only: [:new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    @pot = current_user.pots.build(pot_params)
    if @pot.save
      redirect_to pot_path(@pot), notice: 'Pot was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @pot.update(pot_params)
      redirect_to pot_path, notice: 'Pot was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pot.destroy
    redirect_to pots_path, notice: 'Pot was successfully destroyed.'
  end

  private

  def set_user_pots
    @pots = current_user.pots
  end

  def set_user_pot
    @pot = current_user.pots.find(params[:id])
  end

  def set_new_pot
    @pot = current_user.pots.build
  end

  def pot_params
    params.require(:pot).permit(:name, :goal, :amount, :user_id)
  end
end
