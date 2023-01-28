class AddYoutubeToEpisode < ActiveRecord::Migration[7.0]
  def change
    add_column :episodes, :youtube_id, :string
  end
end
