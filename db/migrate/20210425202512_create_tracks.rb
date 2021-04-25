class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :identifier
      t.string :name
      t.float :duration
      t.integer :times_played
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
