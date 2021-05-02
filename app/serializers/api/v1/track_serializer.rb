class Api::V1::TrackSerializer < ActiveModel::Serializer
  type :track

  attributes(
    :id,
    :name,
    :duration,
    :times_played,
    :album_id,
    :self,
    :album,
    :artist
  )

  def id
    return object.identifier    
  end
  
  def self
    return object.self_url
  end

  def album
    return object.album.self_url
  end

  def artist
    return object.album.artist.self_url
  end

  def album_id
    return object.album.identifier
  end
end
