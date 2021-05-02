API_V1 = {
  swagger: '2.0',
  info: {
    title: 'API V1',
    version: 'v1'
  },
  basePath: '/api/v1',
  definitions: {
    track: TRACK_SCHEMA,
    tracks_collection: TRACKS_COLLECTION_SCHEMA,
    track_resource: TRACK_RESOURCE_SCHEMA,
    album: ALBUM_SCHEMA,
    albums_collection: ALBUMS_COLLECTION_SCHEMA,
    album_resource: ALBUM_RESOURCE_SCHEMA,
    artist: ARTIST_SCHEMA,
    artists_collection: ARTISTS_COLLECTION_SCHEMA,
    artist_resource: ARTIST_RESOURCE_SCHEMA,
  }
}
