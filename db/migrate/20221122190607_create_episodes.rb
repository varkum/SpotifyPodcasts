class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.belongs_to :spotify_account, null: false, foreign_key: true
      t.string :name
      t.string :show
      t.string :image
      t.integer :progress
      t.string :spotify_id
      t.string :status
      t.boolean :starred
      t.datetime :last_played
      
      t.timestamps
    end
  end
end
