class ExtrasController < ApplicationController
  before_action :set_burger
  before_action :set_extra, only: %i[edit update destroy]

  def create
    @extra = @burger.extras.build(extra_params)

    if @extra.save
      redirect_to @burger, notice: "Extra was successfully created."
    else
      redirect_to @burger, alert: @extra.errors.full_messages.to_sentence
    end
  end

  def edit
  end

  def update
    if @extra.update(extra_params)
      redirect_to @burger, notice: "Extra was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @extra.destroy
    redirect_to @burger, notice: "Extra was successfully destroyed."
  end

  private

  def set_burger
    @burger = Burger.find(params[:burger_id])
  end

  def set_extra
    @extra = @burger.extras.find(params[:id])
  end

  def extra_params
    params.require(:extra).permit(:name, :price)
  end
end