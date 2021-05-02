class Api::V1::TracksController < Api::V1::BaseController
  def index
    if params[:artist_id].present?
      respond_with Artist.find_by!(identifier: params[:artist_id]).tracks
    elsif params[:album_id].present?
      respond_with Album.find_by!(identifier: params[:album_id]).tracks
    else
      respond_with Track.all
    end
  end

  def show
    respond_with track
  end

  def create
    album = Album.find_by!(identifier: params[:album_id])
    respond_with Track.create!(track_params.merge(album_id: album.id))
  end

  def destroy
    respond_with track.destroy!
  end

  private

  def track
    @track ||= Track.find_by!(identifier: params[:id])
  end

  def track_params
    params.require([:name, :duration, :album_id])
    params.permit(
      :name,
      :duration,
      :album_id
    )
  end
end
