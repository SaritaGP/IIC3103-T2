class Api::V1::ArtistsController < Api::V1::BaseController
  def index
    respond_with Artist.all
  end

  def show
    respond_with artist
  end

  def create
    respond_with Artist.create!(artist_params)
  end

  def destroy
    respond_with artist.destroy!
  end

  def play
    artist.tracks.each do |track|
      track.times_played += 1
      track.save!
    end
    respond_with true
  end

  private

  def artist
    @artist ||= Artist.find_by!(identifier: params[:id])
  end

  def artist_params
    params.require([:name, :age])
    params.permit(
      :name,
      :age
    )
  end
end
