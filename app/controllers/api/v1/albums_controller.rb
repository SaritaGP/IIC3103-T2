class Api::V1::AlbumsController < Api::V1::BaseController
  def index
    if params[:artist_id].present?
      respond_with Artist.find_by!(identifier: params[:artist_id]).albums
    else
      respond_with Album.all
    end
  end

  def show
    respond_with album
  end

  def create
    artist = Artist.find_by!(identifier: params[:artist_id])
    respond_with Album.create!(album_params.merge(artist_id: artist.id))
  end

  def destroy
    respond_with album.destroy!
  end

  private

  def album
    @album ||= Album.find_by!(identifier: params[:id])
  end

  def album_params
    params.require([:name, :genre, :artist_id])
    params.permit(
      :name,
      :genre
    )
  end
end
