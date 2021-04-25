class CreateArtists < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :identifier
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
