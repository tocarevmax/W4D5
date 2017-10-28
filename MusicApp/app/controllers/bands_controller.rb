class BandsController < ApplicationController

  before_action -> {redirect_to new_session_url}, unless: -> {logged_in?}

  def index
    @bands = Band.all
    render :index
  end

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      redirect_to bands_url
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def show
    @band = Band.find_by(id: params[:id])
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      redirect_to edit_band_url(@band)
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy
    redirect_to bands_url
    # render json: params
  end

  private

  def band_params
    params.require(:bands).permit(:name)
  end
end
