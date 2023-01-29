class AddYoutubeProgress < ActiveRecord::Migration[7.0]
  def change
    add_column :episodes, :youtube_progress, :integer
  end
end
