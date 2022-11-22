class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.belongs_to :spotify_acccount, null: false, foreign_key: true
      t.belongs_to :show, null: false, foreign_key: true
      t.string :name
      t.string :progress
      t.string :spotify_id

      t.timestamps
    end
  end
end
