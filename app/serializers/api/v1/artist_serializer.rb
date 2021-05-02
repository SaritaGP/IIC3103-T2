class Api::V1::ArtistSerializer < ActiveModel::Serializer
  type :artist

  attributes(
    :id,
    :name,
    :age,
    :self,
    :albums,
    :tracks
  )
  def self
    return object.self_url
  end

  def id
    return object.identifier
  end

  def albums
    return "#{object.self_url}/albums"
  end

  def tracks
    return "#{object.self_url}/tracks"
  end
end
