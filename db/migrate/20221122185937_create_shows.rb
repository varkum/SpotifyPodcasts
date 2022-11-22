class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows do |t|
      t.belongs_to :spotify_account, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.string :spotify_id

      t.timestamps
    end
  end
end
