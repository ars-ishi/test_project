class SquiresController < ApplicationController
  before_action :set_squire, only: [:show, :edit, :update, :destroy]

  # GET /squires
  # GET /squires.json
  def index
    @squires = Squire.all
  end

  # GET /squires/1
  # GET /squires/1.json
  def show
  end

  # GET /squires/new
  def new
    @squire = Squire.new
  end

  # GET /squires/1/edit
  def edit
  end

  # POST /squires
  # POST /squires.json
  def create
    @squire = Squire.new(squire_params)

    respond_to do |format|
      if @squire.save
        format.html { redirect_to @squire, notice: 'Squire was successfully created.' }
        format.json { render :show, status: :created, location: @squire }
      else
        format.html { render :new }
        format.json { render json: @squire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /squires/1
  # PATCH/PUT /squires/1.json
  def update
    respond_to do |format|
      if @squire.update(squire_params)
        format.html { redirect_to @squire, notice: 'Squire was successfully updated.' }
        format.json { render :show, status: :ok, location: @squire }
      else
        format.html { render :edit }
        format.json { render json: @squire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /squires/1
  # DELETE /squires/1.json
  def destroy
    @squire.destroy
    respond_to do |format|
      format.html { redirect_to squires_url, notice: 'Squire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_squire
      @squire = Squire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def squire_params
      params.require(:squire).permit(:title, :description)
    end
end
