require 'swagger_helper'

describe 'API V1 Tracks', swagger_doc: 'v1/swagger.json' do
  path '/tracks' do
    get 'Retrieves Tracks' do
      description 'Retrieves all the tracks'
      produces 'application/json'

      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }

      before { create_list(:track, collection_count) }

      response '200', 'Tracks retrieved' do
        schema('$ref' => '#/definitions/tracks_collection')

        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end

    post 'Creates Track' do
      description 'Creates Track'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :track, in: :body)

      response '201', 'track created' do
        let(:track) do
          {
            identifier: 'Some identifier',
            name: 'Some name',
            duration: 6.66,
            times_played: 666,
            album_id: 666
          }
        end

        run_test!
      end
    end
  end

  path '/tracks/{id}' do
    parameter name: :id, in: :path, type: :integer

    let(:existent_track) { create(:track) }
    let(:id) { existent_track.id }

    get 'Retrieves Track' do
      produces 'application/json'

      response '200', 'track retrieved' do
        schema('$ref' => '#/definitions/track_resource')

        run_test!
      end

      response '404', 'invalid track id' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Updates Track' do
      description 'Updates Track'
      consumes 'application/json'
      produces 'application/json'
      parameter(name: :track, in: :body)

      response '200', 'track updated' do
        let(:track) do
          {
            identifier: 'Some identifier',
            name: 'Some name',
            duration: 6.66,
            times_played: 666,
            album_id: 666
          }
        end

        run_test!
      end
    end

    delete 'Deletes Track' do
      produces 'application/json'
      description 'Deletes specific track'

      response '204', 'track deleted' do
        run_test!
      end

      response '404', 'track not found' do
        let(:id) { 'invalid' }

        run_test!
      end
    end
  end
end
