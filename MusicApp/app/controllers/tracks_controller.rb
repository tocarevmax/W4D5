class TracksController < ApplicationController

  before_action -> {redirect_to new_session_url }, unless: -> {logged_in?}

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def new
    @parent_album = Album.find_by(id: params[:album_id])
    render :new
  end

  def create
    @track = Track.new(track_params)
    @parent_album = Album.find_by(id: params[:tracks][:album_id])
    if @track.save
      redirect_to track_url(@track)
    else
      redirect_to new_album_track_url(@parent_album)
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    @parent_album = @track.album
    if @track
      render :edit
    else
      redirect_to bands_url
    end
  end

  def update
    @track = Track.find_by(id: params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      redirect_to edit_track_url(@track)
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @parent_album = @track.album
    if @track.destroy
      redirect_to album_url(@parent_album)
    else
      redirect_to album_url(@parent_album)
    end
  end

  private
  def track_params
    params.require(:tracks).permit(:title, :ord, :album_id, :regular, :lyrics)
  end

end
