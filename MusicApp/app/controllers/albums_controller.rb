class AlbumsController < ApplicationController

  before_action -> {redirect_to new_session_url}, unless: -> {logged_in?}

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def new
    @bands = Band.all
    @band = Band.find_by(id: params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      redirect_to new_band_album_url
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      redirect_to edit_album_url(@album)
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    if @album
      band = @album.band
      @album.destroy
    end
    redirect_to band_url(band)
  end

  private
  def album_params
    params.require(:albums).permit(:title, :year, :studio, :band_id)
  end
end
