class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.integer :album_id, null: false
      t.boolean :regular, default: true #true - regular treck | false - bonus track
      t.text :lyrics
      t.timestamps
    end

    add_index :tracks, :album_id
  end
end

# Track.new(title: "sleep", ord: 1, album_id: 5)
