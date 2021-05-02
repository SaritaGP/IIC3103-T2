TRACK_SCHEMA = {
  type: :object,
  properties: {
    id: { type: :string, example: '1' },
    type: { type: :string, example: 'track' },
    attributes: {
      type: :object,
      properties: {
        identifier: { type: :string, example: 'Some identifier', 'x-nullable': true },
        name: { type: :string, example: 'Some name', 'x-nullable': true },
        duration: { type: :float, example: 6.66, 'x-nullable': true },
        times_played: { type: :integer, example: 666, 'x-nullable': true },
        album_id: { type: :integer, example: 666, 'x-nullable': true },
        created_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true },
        updated_at: { type: :string, example: '1984-06-04 09:00', 'x-nullable': true }
      },
      required: []
    }
  },
  required: %i[
    id
    type
    attributes
  ]
}

TRACKS_COLLECTION_SCHEMA = {
  type: 'object',
  properties: {
    data: {
      type: 'array',
      items: { '$ref' => '#/definitions/track' }
    }
  },
  required: [
    :data
  ]
}

TRACK_RESOURCE_SCHEMA = {
  type: 'object',
  properties: {
    data: { '$ref' => '#/definitions/track' }
  },
  required: [
    :data
  ]
}
