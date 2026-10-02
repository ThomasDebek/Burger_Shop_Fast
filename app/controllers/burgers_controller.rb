class BurgersController < ApplicationController
  before_action :set_burger, only: %i[ show edit update destroy ]

  # GET /burgers or /burgers.json
  def index
    @burgers = Burger.all
  end

  # GET /burgers/1 or /burgers/1.json
  def show
    @extras = @burger.extras.to_a.select(&:persisted?)
    @extra = @burger.extras.build
  end

  # GET /burgers/new
  def new
    @burger = Burger.new
  end

  # GET /burgers/1/edit
  def edit
  end

  # POST /burgers or /burgers.json
  def create
    @burger = Burger.new(burger_params)

    respond_to do |format|
      if @burger.save
        format.html { redirect_to @burger, notice: "Burger was successfully created." }
        format.json { render :show, status: :created, location: @burger }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @burger.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /burgers/1 or /burgers/1.json
  def update
    respond_to do |format|
      if @burger.update(burger_params)
        format.html { redirect_to @burger, notice: "Burger was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @burger }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @burger.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /burgers/1 or /burgers/1.json
  def destroy
    @burger.destroy!

    respond_to do |format|
      format.html { redirect_to burgers_path, notice: "Burger was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_burger
      @burger = Burger.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def burger_params
      params.expect(burger: [ :name, :price, :stock, :size ])
    end
end
