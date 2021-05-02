class Api::V1::AlbumSerializer < ActiveModel::Serializer
  type :album

  attributes(
    :id,
    :name,
    :genre,
    :artist_id,
    :artist,
    :self
  )

  def id
    return object.identifier
  end

  def artist_id
    return object.artist.identifier
  end

  def artist
    return object.artist.self_url
  end

  def self
    return object.self_url
  end
end
