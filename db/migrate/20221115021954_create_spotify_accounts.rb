class CreateSpotifyAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :spotify_accounts do |t|
      t.string :name
      t.string :username
      t.string :image
      t.string :access_token
      t.string :refresh_token

      t.timestamps
    end
  end
end
